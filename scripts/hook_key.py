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

function doHook() {
    if (isHooked) return;
    var targetAddr = Module.findExportByName(moduleName, "sqlite3_key");
    if (targetAddr) {
        send("[+] sqlite3_key 함수 발견! 후킹을 시작합니다: " + targetAddr);
        Interceptor.attach(targetAddr, {
            onEnter: function(args) {
                var nKey = args[2].toInt32();
                send("\\n==================================================");
                send("[!] sqlite3_key 호출 감지!");
                send("[!] 전달된 키 길이(nKey): " + nKey + " bytes");
                if (nKey > 0) {
                    send("\\n[Key Hex Dump]");
                    send(hexdump(args[1], {length: nKey, header: true, ansi: false}));
                    try {
                        send("\\n[Key String (UTF-8)]");
                        send(Memory.readUtf8String(args[1], nKey));
                    } catch(e) {
                        send("(문자열로 읽을 수 없는 바이너리 데이터입니다)");
                    }
                }
                send("==================================================\\n");
            }
        });
        isHooked = true;
    }
}

// 안드로이드 하위 버전용 dlopen 감지
Interceptor.attach(Module.findExportByName(null, "dlopen"), {
    onEnter: function(args) { this.path = args[0].readUtf8String(); },
    onLeave: function(retval) { if (this.path && this.path.indexOf(moduleName) !== -1) doHook(); }
});

// 안드로이드 상위 버전용 dlopen 감지
var android_dlopen_ext = Module.findExportByName(null, "android_dlopen_ext");
if (android_dlopen_ext) {
    Interceptor.attach(android_dlopen_ext, {
        onEnter: function(args) { this.path = args[0].readUtf8String(); },
        onLeave: function(retval) { if (this.path && this.path.indexOf(moduleName) !== -1) doHook(); }
    });
}

// 이미 로드되어 있는 경우 즉시 후킹
if (Process.findModuleByName(moduleName)) {
    doHook();
}
"""

try:
    device = frida.get_usb_device()
    print("[*] Z3 Tablet 연결 확인 완료. 앱을 강제 실행합니다...")
    # 앱 패키지명 실행 및 프로세스 일시정지 (Spawn)
    pid = device.spawn(["com.wordnet.dic.synonym"])
    session = device.attach(pid)
    
    script = session.create_script(js_code)
    script.on('message', on_message)
    script.load()
    
    # 앱 실행 재개
    device.resume(pid)
    print("[*] 감시망이 쳐졌습니다. 태블릿 화면에서 앱이 켜지는지 확인하십시오.")
    print("[*] 스크립트를 종료하려면 아무 키나 누르세요...\n")
    sys.stdin.read()
except Exception as e:
    print(f"[!] 스크립트 실행 중 에러 발생: {e}")