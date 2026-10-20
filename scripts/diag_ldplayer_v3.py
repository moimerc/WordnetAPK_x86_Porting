import subprocess
import time
import sys

APP_PKG = "com.wordnet.dic.synonym"
ADB = r"C:\LDPlayer\LDPlayer3.0\adb.exe"
SERIAL = "emulator-5554"


def adb(cmd, timeout=20, quiet=False):
    full = f'"{ADB}" -s {SERIAL} {cmd}'
    if not quiet:
        print(f"  $ {cmd}")
    try:
        r = subprocess.run(full, shell=True, capture_output=True, text=True,
                           errors="replace", timeout=timeout)
        return (r.stdout or "").strip()
    except subprocess.TimeoutExpired:
        print("  [TIMEOUT]")
        return ""


def section(title):
    print()
    print("=" * 65)
    print(title)
    print("=" * 65)


# ----- 1. 연결 확인 (서버 재시작 안 함) -----
section("1. 연결된 디바이스")
out = adb("devices", quiet=True)
print(out)
if "device" not in out:
    print("연결 실패. 사용자님이 수동으로 adb devices 해보세요.")
    sys.exit(1)

# ----- 2. ABI -----
section("2. LDPlayer ABI 정보")
for p in ["ro.product.cpu.abi", "ro.product.cpu.abilist",
          "ro.product.cpu.abilist32", "ro.dalvik.vm.native.bridge",
          "ro.enable.native.bridge.exec"]:
    val = adb(f"shell getprop {p}", quiet=True)
    print(f"  {p:45s} = {val or '(없음)'}")

# ----- 3. 앱 설치 확인 -----
section("3. 사전 앱 설치 확인")
pkgs = adb(f"shell pm list packages | grep wordnet", quiet=True)
print(f"  패키지: {pkgs or '(없음)'}")
apk_path = adb(f"shell pm path {APP_PKG}", quiet=True)
print(f"  APK 경로: {apk_path or '(없음)'}")

if not apk_path:
    print("  → 앱이 설치 안 됨. 설치 후 다시 실행.")
    sys.exit(1)

# ----- 4. lib 폴더 확인 -----
section("4. 설치된 lib 폴더 구조")
if ":" in apk_path:
    base = apk_path.split(":", 1)[1].strip()
else:
    base = apk_path
app_dir = base.rsplit("/", 1)[0]
print(f"  앱 폴더: {app_dir}")
for arch in ["x86", "x86_64", "armeabi", "armeabi-v7a", "arm64-v8a"]:
    out = adb(f"shell ls {app_dir}/lib/{arch}/ 2>/dev/null", quiet=True)
    if out and "No such" not in out:
        print(f"\n  [{arch}]")
        for line in out.split("\n"):
            print(f"    {line}")

# ----- 5. 앱 강제 재시작 -----
section("5. 앱 강제 재시작")
print("  force-stop...")
adb(f"shell am force-stop {APP_PKG}", quiet=True)
time.sleep(2)

print("  launch...")
adb(f"shell monkey -p {APP_PKG} -c android.intent.category.LAUNCHER 1",
    quiet=True)
print("  앱 시작 대기 중 (6초)...")
time.sleep(6)

pid = adb(f"shell pidof {APP_PKG}", quiet=True)
if not pid:
    print("  ❌ 앱이 실행되지 않음")
    sys.exit(1)
print(f"  ✅ PID = {pid}")

# ----- 6. .so 매핑 -----
section("6. 프로세스가 로드한 .so")
maps = adb(f"shell cat /proc/{pid}/maps", quiet=True, timeout=30)
relevant = [l for l in maps.split("\n")
            if any(k in l for k in
                   ["sqlcipher", "stlport", "img_utils",
                    "native_bridge", "houdini"])]
if relevant:
    for l in relevant:
        print(f"  {l}")
else:
    print("  (관련 .so 매핑 없음 — 아직 로드 안 된 상태)")

# ----- 7. 검은 화면 탭 유도 -----
section("7. 검은 화면 탭 유도")
print("  LDPlayer 화면에서 사전 앱의 검은 화면을 탭하세요.")
print("  10초 대기...")
time.sleep(10)

pid2 = adb(f"shell pidof {APP_PKG}", quiet=True)
if pid2:
    print(f"  ✅ 앱 살아있음 (PID={pid2})")
else:
    print(f"  ❌ 앱 사망 — 크래시 발생")

# ----- 8. logcat -----
section("8. logcat (관련 라인만)")
logcat = adb("logcat -d -t 500", quiet=True, timeout=25)
keys = ["sqlcipher", "native_bridge", "houdini", "JNI",
        "SIGSEGV", "Fatal", "DEBUG", "libimg_utils",
        "wordnet", "backtrace"]
for l in logcat.split("\n"):
    if any(k.lower() in l.lower() for k in keys):
        print(f"  {l}")

print()
print("=" * 65)
print("완료")
print("=" * 65)