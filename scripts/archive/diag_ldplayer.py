import subprocess
import os
import glob

APP_PKG = "com.wordnet.dic.synonym"
ADB = r"C:\LDPlayer\LDPlayer3.0\adb.exe"
# 필요 시 시리얼 지정 (예: "emulator-5554"). 빈 문자열이면 자동 선택.
SERIAL = "emulator-5554"


def adb(cmd, timeout=10):
    prefix = f'-s {SERIAL}' if SERIAL else ''
    full = f'"{ADB}" {prefix} {cmd}'
    try:
        r = subprocess.run(full, shell=True, capture_output=True, text=True,
                           errors="replace", timeout=timeout)
        return r.stdout, r.stderr
    except subprocess.TimeoutExpired:
        return "", "TIMEOUT"


def step(n, msg):
    print(f"\n{'='*70}\n[{n}] {msg}\n{'='*70}")


def main():
    step(1, f"ADB 서버 재시작 (SERIAL={SERIAL or 'auto'})")
    subprocess.run(f'"{ADB}" kill-server', shell=True, capture_output=True)
    subprocess.run(f'"{ADB}" start-server', shell=True, capture_output=True)
    out, _ = adb("devices")
    print(out)

    step(2, "ABI 정보")
    for p in ["ro.product.cpu.abi", "ro.product.cpu.abilist",
              "ro.product.cpu.abilist32", "ro.dalvik.vm.native.bridge",
              "ro.enable.native.bridge.exec"]:
        out, _ = adb(f"shell getprop {p}")
        print(f"  {p}: {out.strip() or '(없음)'}")

    step(3, "사전 앱 설치 여부")
    out, _ = adb(f"shell pm list packages | grep wordnet")
    print(f"  {out.strip() or '(wordnet 관련 패키지 없음)'}")

    out, _ = adb(f"shell pm path {APP_PKG}")
    apk_path = out.strip()
    print(f"  APK 경로: {apk_path or '(설치 안 됨)'}")
    if not apk_path:
        print("  → 이 인스턴스에 앱이 없습니다. 다른 인스턴스에 설치된 것입니다.")
        print("  → LDPlayer 매니저에서 확인하거나, 이 인스턴스에 APK를 새로 설치하세요.")
        return

    step(4, "설치된 앱의 lib 폴더 구조")
    # base.apk 위치에서 실제 lib 경로 도출
    # pm path 결과: package:/data/app/com.wordnet.dic.synonym-1/base.apk
    if ":" in apk_path:
        base_path = apk_path.split(":", 1)[1].strip()
    else:
        base_path = apk_path
    app_dir = os.path.dirname(base_path)  # /data/app/com.wordnet.dic.synonym-1
    print(f"  앱 디렉토리: {app_dir}")

    # lib 폴더
    out, _ = adb(f"shell ls -la {app_dir}/lib/")
    print(f"  [lib 폴더]")
    print(f"  {out.strip() or '(없음)'}")

    for arch in ["x86", "x86_64", "armeabi", "armeabi-v7a", "arm64-v8a"]:
        out, _ = adb(f"shell ls {app_dir}/lib/{arch}/ 2>/dev/null")
        if out.strip() and "No such" not in out:
            print(f"\n  [{arch}]")
            for line in out.strip().split("\n"):
                print(f"    {line}")

    step(5, "앱 실행 상태")
    out, _ = adb(f"shell pidof {APP_PKG}")
    pid = out.strip()
    print(f"  PID: {pid or '(실행 중 아님)'}")
    if not pid:
        print("  → LDPlayer 화면에서 사전 앱을 실행하세요 (검은 화면 뜨면 그대로 두기)")
        input("  → 실행 후 Enter...")
        out, _ = adb(f"shell pidof {APP_PKG}")
        pid = out.strip()
        print(f"  PID: {pid or '(여전히 실행 중 아님)'}")
        if not pid:
            return

    step(6, "프로세스의 .so 매핑")
    out, _ = adb(f'shell cat /proc/{pid}/maps')
    relevant = [l for l in out.split("\n")
                if any(k in l for k in ["sqlcipher", "stlport", "img_utils",
                                        "native_bridge", "houdini"])]
    if relevant:
        for l in relevant:
            print(f"  {l}")
    else:
        print("  (관련 .so 매핑 없음)")

    step(7, "logcat (JNI/Houdini/크래시)")
    out, _ = adb("logcat -d -t 400", timeout=15)
    keys = ["sqlcipher", "native_bridge", "houdini", "JNI",
            "SIGSEGV", "Fatal", "DEBUG", "libimg_utils", APP_PKG]
    lines = [l for l in out.split("\n") if any(k.lower() in l.lower() for k in keys)]
    for l in lines[-60:]:
        print(f"  {l}")


if __name__ == "__main__":
    main()