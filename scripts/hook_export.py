import frida
import sys

def on_message(message, data):
    if message['type'] == 'send':
        print(message['payload'])
    elif message['type'] == 'error':
        print(f"[!] 에러: {message['stack']}")

js_code = """
var moduleName = "libdatabase_sqlcipher.so";
var isHooked = false;
var isExported = false;

function doHook() {
    if (isHooked) return;
    var keyAddr = Module.findExportByName(moduleName, "sqlite3_key");
    var execAddr = Module.findExportByName(moduleName, "sqlite3_exec");
    var errAddr = Module.findExportByName(moduleName, "sqlite3_errmsg");
    
    if (keyAddr && execAddr) {
        send("[+] 앱 자체 엔진 가로채기 준비 완료.");
        var sqlite3_exec = new NativeFunction(execAddr, 'int', ['pointer', 'pointer', 'pointer', 'pointer', 'pointer']);
        var sqlite3_errmsg = new NativeFunction(errAddr, 'pointer', ['pointer']);
        
        Interceptor.attach(keyAddr, {
            onEnter: function(args) {
                this.db = args[0]; // 데이터베이스 포인터
                this.nKey = args[2].toInt32();
            },
            onLeave: function(retval) {
                if (!isExported && this.nKey > 0) { 
                    isExported = true;
                    send("[!] 열쇠 장착 확인. 앱 엔진을 조종하여 평문 DB 추출을 시작합니다...");
                    send("[*] 주의: 태블릿에서 앱 화면이 잠시 멈출 수 있습니다. 기다려주세요.");
                    
                    // 태블릿 내부의 안전한 앱 데이터 폴더에 평문 DB 저장
                    var targetPath = "/data/data/com.wordnet.dic.synonym/files/plaintext_final.db";
                    
                    // SQLCipher 전용 추출 명령 (ATTACH & sqlcipher_export)
                    var query = "ATTACH DATABASE '" + targetPath + "' AS plaintext KEY ''; " +
                                "SELECT sqlcipher_export('plaintext'); " +
                                "DETACH DATABASE plaintext;";
                    var sqlPtr = Memory.allocUtf8String(query);
                    
                    // 강제 실행
                    var res = sqlite3_exec(this.db, sqlPtr, ptr(0), ptr(0), ptr(0));
                    
                    if (res === 0) {
                        send("🎉 완벽합니다! 앱이 스스로 평문 DB를 생성해 냈습니다.");
                        send("저장 위치: " + targetPath);
                    } else {
                        var errorMsg = sqlite3_errmsg(this.db).readUtf8String();
                        send("❌ SQL 실행 에러 발생 (코드: " + res + ") - " + errorMsg);
                    }
                }
            }
        });
        isHooked = true;
    }
}

// Android 라이브러리 로드 감지
var android_dlopen_ext = Module.findExportByName(null, "android_dlopen_ext");
if (android_dlopen_ext) {
    Interceptor.attach(android_dlopen_ext, {
        onEnter: function(args) { this.path = args[0].readUtf8String(); },
        onLeave: function(retval) { if (this.path && this.path.indexOf(moduleName) !== -1) doHook(); }
    });
}
Interceptor.attach(Module.findExportByName(null, "dlopen"), {
    onEnter: function(args) { this.path = args[0].readUtf8String(); },
    onLeave: function(retval) { if (this.path && this.path.indexOf(moduleName) !== -1) doHook(); }
});

if (Process.findModuleByName(moduleName)) {
    doHook();
}
"""

try:
    device = frida.get_usb_device()
    print("[*] 추출 스크립트 가동. 앱을 켭니다...")
    pid = device.spawn(["com.wordnet.dic.synonym"])
    session = device.attach(pid)
    
    script = session.create_script(js_code)
    script.on('message', on_message)
    script.load()
    
    device.resume(pid)
    sys.stdin.read()
except Exception as e:
    print(f"[!] 에러 발생: {e}")