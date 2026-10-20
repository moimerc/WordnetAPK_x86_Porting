import frida
import sys
import subprocess
import os
from datetime import datetime

# ============================================================
# 설정
# ============================================================
WORK_DIR = r"C:\Users\moimerc\ATELIER\Wordnet_project"
APP_PKG = "com.wordnet.dic.synonym"
LOG_DIR = os.path.join(WORK_DIR, "frida_recon")
os.makedirs(LOG_DIR, exist_ok=True)

timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
KEY_LOG = os.path.join(LOG_DIR, f"sqlite_keys_{timestamp}.txt")
SO_LOG = os.path.join(LOG_DIR, f"loaded_libs_{timestamp}.txt")
BOOKMARK_DB = os.path.join(WORK_DIR, "synBookmark.db")


def adb(cmd):
    r = subprocess.run(cmd, shell=True, capture_output=True, text=True, errors="replace")
    return r.stdout, r.stderr


def step(msg):
    print(f"\n{'='*60}\n{msg}\n{'='*60}", flush=True)


# ============================================================
# PART 1: synBookmark.db 추출
# ============================================================
def extract_bookmark_db():
    step("[1/3] synBookmark.db 추출")
    adb(f'adb shell su -c "cp /data/data/{APP_PKG}/databases/synBookmark.db /data/local/tmp/"')
    adb('adb shell su -c "chmod 666 /data/local/tmp/synBookmark.db"')
    out, err = adb(f'adb pull /data/local/tmp/synBookmark.db "{BOOKMARK_DB}"')
    print(out)
    if err:
        print(f"stderr: {err}")
    if os.path.exists(BOOKMARK_DB):
        size = os.path.getsize(BOOKMARK_DB)
        print(f"✅ synBookmark.db 추출 성공 ({size} bytes)")
        # 내용 미리보기
        try:
            import sqlite3
            conn = sqlite3.connect(BOOKMARK_DB)
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
            print(f"   (내용 열기 실패: {e})")
    else:
        print("❌ synBookmark.db 추출 실패")


# ============================================================
# Frida JS 스크립트
# ============================================================
JS_CODE = r"""
var moduleName = "libdatabase_sqlcipher.so";
var appLibPrefix = "/data/app-lib/";
var appDataPrefix = "/data/data/";

var keyHooked = false;
var dlopenHooked = false;

function hookKey() {
    if (keyHooked) return;
    var keyAddr = Module.findExportByName(moduleName, "sqlite3_key");
    if (!keyAddr) return;
    send("[KEY] sqlite3_key 발견: " + keyAddr);
    Interceptor.attach(keyAddr, {
        onEnter: function(args) {
            var nKey = args[2].toInt32();
            var keyStr = "";
            var keyHex = "";
            try { keyStr = Memory.readUtf8String(args[1], nKey); } catch(e) {}
            try {
                keyHex = hexdump(args[1], {length: Math.min(nKey, 64), header: false, ansi: false});
            } catch(e) {}
            send("[KEY_CALL] nKey=" + nKey + " | UTF8=" + keyStr + "\nHEX:\n" + keyHex);
        }
    });
    keyHooked = true;
}

function hookDlopen() {
    if (dlopenHooked) return;
    var dlopenAddr = Module.findExportByName(null, "dlopen");
    if (dlopenAddr) {
        Interceptor.attach(dlopenAddr, {
            onEnter: function(args) {
                try {
                    var path = args[0].readUtf8String();
                    if (path && (path.indexOf(appLibPrefix) !== -1 || path.indexOf(appDataPrefix) !== -1)) {
                        send("[DLOPEN] " + path);
                    }
                } catch(e) {}
            }
        });
    }
    var extAddr = Module.findExportByName(null, "android_dlopen_ext");
    if (extAddr) {
        Interceptor.attach(extAddr, {
            onEnter: function(args) {
                try {
                    var path = args[0].readUtf8String();
                    if (path && (path.indexOf(appLibPrefix) !== -1 || path.indexOf(appDataPrefix) !== -1)) {
                        send("[DLOPEN_EXT] " + path);
                    }
                } catch(e) {}
            }
        });
    }
    dlopenHooked = true;
}

// dlopen 로깅 즉시 시작
hookDlopen();

// SQLCipher 이미 로드됨?
if (Process.findModuleByName(moduleName)) {
    hookKey();
} else {
    // 로드될 때까지 대기
    var watch_dlopen = Module.findExportByName(null, "dlopen");
    if (watch_dlopen) {
        Interceptor.attach(watch_dlopen, {
            onEnter: function(args) { try { this.path = args[0].readUtf8String(); } catch(e) { this.path = null; } },
            onLeave: function(retval) {
                if (this.path && this.path.indexOf(moduleName) !== -1) hookKey();
            }
        });
    }
    var watch_ext = Module.findExportByName(null, "android_dlopen_ext");
    if (watch_ext) {
        Interceptor.attach(watch_ext, {
            onEnter: function(args) { try { this.path = args[0].readUtf8String(); } catch(e) { this.path = null; } },
            onLeave: function(retval) {
                if (this.path && this.path.indexOf(moduleName) !== -1) hookKey();
            }
        });
    }
}
"""


# ============================================================
# PART 2, 3: Frida 후킹
# ============================================================
def run_frida_recon():
    step("[2/3, 3/3] Frida 후킹 (sqlite3_key + dlopen)")
    print("앱을 강제 실행합니다.")
    print("태블릿 화면에서 앱이 뜨면:")
    print("  1) 단어 여러 개를 검색해 주세요")
    print("  2) 단어장(즐겨찾기)에 단어를 추가/삭제해 주세요")
    print("  3) 5~10초 정도 조작 후 이 창에서 Enter를 누르세요.\n")

    key_file = open(KEY_LOG, "w", encoding="utf-8")
    so_file = open(SO_LOG, "w", encoding="utf-8")

    def on_message(message, data):
        if message["type"] == "send":
            payload = message["payload"]
            print(payload)
            if payload.startswith("[KEY"):
                key_file.write(payload + "\n")
                key_file.flush()
            elif payload.startswith("[DLOPEN"):
                so_file.write(payload + "\n")
                so_file.flush()
        elif message["type"] == "error":
            print(f"[!] Frida 에러: {message['stack']}")

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
        key_file.close()
        so_file.close()

    print(f"\n✅ 키 로그: {KEY_LOG}")
    print(f"✅ 라이브러리 로그: {SO_LOG}")

    # 결과 요약
    with open(KEY_LOG, encoding="utf-8") as f:
        keys = f.read()
    print(f"\n[키 로그 요약]")
    print(f"  sqlite3_key 호출 횟수: {keys.count('[KEY_CALL]')}회")
    print(f"  발견된 라이브러리: ", end="")
    with open(SO_LOG, encoding="utf-8") as f:
        so_lines = [l.strip() for l in f if l.strip()]
    print(f"{len(so_lines)}개")


def main():
    print(f"로그 저장 경로: {LOG_DIR}")

    extract_bookmark_db()
    run_frida_recon()

    print(f"\n{'='*60}")
    print("완료. 다음 파일들을 확인하세요:")
    print(f"  - {BOOKMARK_DB}")
    print(f"  - {KEY_LOG}")
    print(f"  - {SO_LOG}")


if __name__ == "__main__":
    main()