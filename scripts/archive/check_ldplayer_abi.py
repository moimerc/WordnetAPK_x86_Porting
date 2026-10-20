import subprocess

LD_ADB = r"C:\LDPlayer\LDPlayer3.0\adb.exe"  # LDPlayer 설치 경로에 맞게 수정
APP_PKG = "com.wordnet.dic.synonym"


def adb(cmd):
    full = f'"{LD_ADB}" {cmd}'
    r = subprocess.run(full, shell=True, capture_output=True, text=True, errors="replace")
    return r.stdout, r.stderr


def step(msg):
    print(f"\n{'='*60}\n{msg}\n{'='*60}")


def main():
    step("[1] LDPlayer의 CPU ABI")
    for prop in ["ro.product.cpu.abi", "ro.product.cpu.abi2",
                 "ro.product.cpu.abilist",
                 "ro.dalvik.vm.native.bridge",
                 "ro.enable.native.bridge.exec"]:
        out, _ = adb(f'shell getprop {prop}')
        print(f"  {prop}: {out.strip() or '(없음)'}")

    step("[2] 앱 설치 경로 확인")
    out, _ = adb(f'shell pm path {APP_PKG}')
    print(out)

    step("[3] 앱이 설치된 후 어떤 .so가 어디에 추출됐는지")
    # /data/app/<pkg>-1/lib/ 아래 확인
    out, _ = adb(f'shell ls -la /data/app/{APP_PKG}-1/lib/')
    print(out)

    # 각 아키텍처 폴더 확인
    for arch in ["x86", "x86_64", "armeabi", "armeabi-v7a", "arm64-v8a"]:
        out, _ = adb(f'shell ls -la /data/app/{APP_PKG}-1/lib/{arch}/ 2>/dev/null')
        if out.strip():
            print(f"\n[{arch}]")
            print(out)

    step("[4] 프로세스가 실제로 로드한 .so (실행 중일 때만)")
    out, _ = adb(f'shell pidof {APP_PKG}')
    pid = out.strip()
    if pid:
        print(f"PID: {pid}")
        out, _ = adb(f'shell su -c "cat /proc/{pid}/maps | grep -E \'sqlcipher|database_sqlcipher|stlport\'"')
        print(out if out.strip() else "(sqlcipher 관련 매핑 없음)")
    else:
        print("앱이 실행 중이 아님. 앱을 켠 상태로 다시 실행하세요.")

    step("[5] 최근 크래시 로그")
    out, _ = adb('logcat -d -t 200')
    print(out[-3000:] if len(out) > 3000 else out)


if __name__ == "__main__":
    main()