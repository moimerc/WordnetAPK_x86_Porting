import frida
import sys
import subprocess
import os
from datetime import datetime

WORK_DIR = r"C:\Users\moimerc\ATELIER\Wordnet_project"
APP_PKG = "com.wordnet.dic.synonym"
LOG_DIR = os.path.join(WORK_DIR, "frida_recon")
os.makedirs(LOG_DIR, exist_ok=True)

timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
MODULE_LOG = os.path.join(LOG_DIR, f"modules_{timestamp}.txt")
KEY_LOG = os.path.join(LOG_DIR, f"keys_{timestamp}.txt")
CRASH_LOG = os.path.join(LOG_DIR, f"crash_{timestamp}.txt")


def adb(cmd):
    r = subprocess.run(cmd, shell=True, capture_output=True, text=True, errors="replace")
    return r.stdout, r.stderr


def step(msg):
    print(f"\n{'='*60}\n{msg}\n{'='*60}", flush=True)


# ============================================================
# PART 1: synBookmark.db — exec-out로 직접 스트리밍
# ============================================================
def extract_bookmark():
    step("[1/4] synBookmark.db 추출 (exec-out)")
    dst = os.path.join(WORK_DIR, "synBookmark.db")
    cmd = f'adb exec-out su -c "cat /data/data/{APP_PKG}/databases/synBookmark.db"'
    with open(dst, "wb") as f:
        r = subprocess.run(cmd, shell=True, stdout=f, stderr=subprocess.PIPE)
    if os.path.exists(dst) and os.path.getsize(dst) > 0:
        size = os.path.getsize(dst)
        print(f"✅ 추출 성공 ({size} bytes)")
        try:
            import sqlite3
            conn = sqlite3.connect(dst)
            tables = [r[0] for r in conn.execute(
                "SELECT name FROM sqlite_master WHERE type='table'").fetchall()]
            print(f"   테이블: {tables}")
            for t in tables:
                if t == "android_metadata":
                    continue
                try:
                    cnt = conn.execute(f"SELECT count(*) FROM {t}").fetchone()[0]
                    print(f"   {t}: {cnt}행")
                except Exception:
                    pass
            conn.close()
        except Exception as e:
            print(f"   내용 열기 실패: {e}")
    else:
        print(f"❌ 실패. stderr: {r.stderr.decode('utf-8', errors='replace')}")


# ============================================================
# PART 2: Frida 스크립트 (모듈 목록 + 키 후킹 + 예외 후킹)
# ============================================================
JS_CODE = r"""
// 1) 로드된 모든 모듈 덤프 (앱 시작 시점)
function dumpModules() {
    var mods = Process.enumerateModules();
    send("[MODULES_COUNT] " + mods.length);
    for (var i = 0; i < mods.length; i++) {
        var m = mods[i];
        // 앱 관련 경로만 필터
        if (m.path.indexOf("com.wordnet") !== -1 ||
            m.path.indexOf("/data/app") !== -1 ||
            m.path.indexOf("sqlcipher") !== -1 ||
            m.path.indexOf("img_utils") !== -1) {
            send("[MODULE] " + m.name + " | " + m.path + " | base=" + m.base + " size=" + m.size);
        }
    }
}

// 2) dlopen 후킹 (모든 호출 로깅, 필터 없이)
function hookAllDlopen() {
    var targets = ["dlopen", "android_dlopen_ext"];
    targets.forEach(function(name) {
        var addr = Module.findExportByName(null, name);
        if (!addr) return;
        Interceptor.attach(addr, {
            onEnter: function(args) {
                try {
                    var p = args[0].readUtf8String();
                    if (p) send("[" + name + "] " + p);
                } catch(e) {}
            }
        });
    });
}

// 3) sqlite3_key 후킹 (모든 호출)
function hookKey() {
    var libNames = ["libdatabase_sqlcipher.so", "libsqlcipher_android.so"];
    libNames.forEach(function(lib) {
        var addr = Module.findExportByName(lib, "sqlite3_key");
        if (!addr) return;
        send("[KEY_HOOKED] " + lib + " @ " + addr);
        Interceptor.attach(addr, {
            onEnter: function(args) {
                var nKey = args[2].toInt32();
                var k = "";
                try { k = Memory.readUtf8String(args[1], nKey); } catch(e) {}
                send("[KEY_CALL] lib=" + lib + " db=" + args[0] + " nKey=" + nKey + " key=" + k);
            }
        });
    });
}

// 4) Java 예외 후킹 — 크래시 원인 추적
function hookJavaExceptions() {
    if (!Java.available) {
        send("[!] Java VM 없음");
        return;
    }
    Java.perform(function() {
        try {
            var Log = Java.use("android.util.Log");
            Log.e.overload("java.lang.String", "java.lang.String").implementation = function(tag, msg) {
                if (tag && (tag.indexOf("DIC") !== -1 || tag.indexOf("sqlcipher") !== -1 ||
                            tag.indexOf("SQLite") !== -1 || tag.indexOf("DatabaseHelper") !== -1)) {
                    send("[LOG_E] " + tag + ": " + msg);
                }
                return this.e(tag, msg);
            };
        } catch(e) { send("[!] Log hook 실패: " + e); }

        // Bookmark 관련 클래스 접근 감시
        try {
            var helper = Java.use("com.wordnet.dic.synonym.data.DatabaseHelper");
            send("[+] DatabaseHelper 클래스 접근 성공");
            // 주요 메서드 후킹
            var methods = ["getInstance", "getPyojaeData", "getDicSynonymData", "getDicAntonymData"];
            methods.forEach(function(m) {
                try {
                    helper[m].overloads.forEach(function(ov) {
                        ov.implementation = function() {
                            send("[DatabaseHelper." + m + "] called");
                            return ov.apply(this, arguments);
                        };
                    });
                } catch(e) {}
            });
        } catch(e) { send("[!] DatabaseHelper 접근 실패: " + e); }

        // BookmarkHelper
        try {
            var bk = Java.use("com.wordnet.dic.synonym.data.BookmarkHelper");
            send("[+] BookmarkHelper 클래스 발견");
            var bkMethods = bk.class.getDeclaredMethods();
            bkMethods.forEach(function(mm) {
                var name = mm.getName();
                if (name.indexOf("get") === 0 || name.indexOf("insert") === 0 ||
                    name.indexOf("delete") === 0 || name.indexOf("add") === 0) {
                    try {
                        bk[name].overloads.forEach(function(ov) {
                            ov.implementation = function() {
                                send("[BookmarkHelper." + name + "] called");
                                try {
                                    return ov.apply(this, arguments);
                                } catch(e) {
                                    send("[BookmarkHelper." + name + "] EXCEPTION: " + e);
                                    throw e;
                                }
                            };
                        });
                    } catch(e) {}
                }
            });
        } catch(e) { send("[!] BookmarkHelper 접근 실패: " + e); }

        // SQLiteDatabase (net.sqlcipher) 오픈 후킹
        try {
            var SQLDb = Java.use("net.sqlcipher.database.SQLiteDatabase");
            SQLDb.openOrCreateDatabase.overloads.forEach(function(ov) {
                ov.implementation = function() {
                    var args = Array.prototype.slice.call(arguments);
                    send("[SQLiteDatabase.openOrCreateDatabase] path=" + args[0] +
                         " hasPassword=" + (args.length > 1 && args[1] !== null));
                    return ov.apply(this, arguments);
                };
            });
            SQLDb.loadLibs.overloads.forEach(function(ov) {
                ov.implementation = function() {
                    send("[SQLiteDatabase.loadLibs] called");
                    return ov.apply(this, arguments);
                };
            });
        } catch(e) { send("[!] net.sqlcipher.database.SQLiteDatabase 후킹 실패: " + e); }

        // 일반적인 Exception 잡기
        try {
            var Thread = Java.use("java.lang.Thread");
            var UEH = Java.use("java.lang.Thread$UncaughtExceptionHandler");
            send("[+] Exception 후킹 준비됨");
        } catch(e) {}
    });
}

// 실행
dumpModules();
hookAllDlopen();
hookKey();
hookJavaExceptions();

// 3초 후 모듈 다시 덤프 (앱 시작 후 로드된 것들)
setTimeout(function() {
    send("--- [3초 후 모듈 재덤프] ---");
    dumpModules();
}, 3000);
"""


def run_frida():
    step("[2/4, 3/4, 4/4] Frida 후킹 실행")
    print("앱 시작 → 로딩 완료 후 태블릿에서:")
    print("  1) 검색창에서 단어 2~3개 검색")
    print("  2) 단어장 아이콘을 눌러서 크래시 유발")
    print("  3) 크래시 후 이 창에서 Enter\n")

    mod_f = open(MODULE_LOG, "w", encoding="utf-8")
    key_f = open(KEY_LOG, "w", encoding="utf-8")
    crash_f = open(CRASH_LOG, "w", encoding="utf-8")

    def on_message(message, data):
        if message["type"] == "send":
            p = message["payload"]
            print(p)
            if p.startswith("[MODULE") or p.startswith("---"):
                mod_f.write(p + "\n"); mod_f.flush()
            elif p.startswith("[KEY") or p.startswith("[SQLiteDatabase"):
                key_f.write(p + "\n"); key_f.flush()
            else:
                crash_f.write(p + "\n"); crash_f.flush()
        elif message["type"] == "error":
            print(f"[!] {message['stack']}")
            crash_f.write(f"[ERROR] {message['stack']}\n"); crash_f.flush()

    device = frida.get_usb_device()
    pid = device.spawn([APP_PKG])
    session = device.attach(pid)
    script = session.create_script(JS_CODE)
    script.on("message", on_message)
    script.load()
    device.resume(pid)

    try:
        input()
    except KeyboardInterrupt:
        pass
    finally:
        mod_f.close(); key_f.close(); crash_f.close()

    print(f"\n✅ 모듈 로그: {MODULE_LOG}")
    print(f"✅ 키 로그: {KEY_LOG}")
    print(f"✅ 이벤트/크래시 로그: {CRASH_LOG}")


def get_logcat():
    step("[보너스] 크래시 직후 logcat 덤프")
    out, _ = adb(f'adb logcat -d -t 200 > "{os.path.join(LOG_DIR, "logcat_tail.txt")}"')
    print(f"logcat 저장: {os.path.join(LOG_DIR, 'logcat_tail.txt')}")


def main():
    print(f"로그 경로: {LOG_DIR}")
    extract_bookmark()
    run_frida()
    get_logcat()
    print("\n=== 완료 ===")


if __name__ == "__main__":
    main()