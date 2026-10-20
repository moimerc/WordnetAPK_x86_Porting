import subprocess
import os

APP_PKG = "com.wordnet.dic.synonym"
ADB = r"C:\LDPlayer\LDPlayer3.0\adb.exe"
SERIAL = "emulator-5554"
# 사용자님의 재패키징 결과 APK 경로로 수정
LOCAL_APK = r"C:\Users\moimerc\ATELIER\Wordnet_project\synonym_LDPlayer_mod(3.3.1).apk"  # 또는 -aligned-debugSigned.apk


def adb(cmd, timeout=20):
    full = f'"{ADB}" -s {SERIAL} {cmd}'
    try:
        r = subprocess.run(full, shell=True, capture_output=True, text=True,
                           errors="replace", timeout=timeout)
        return (r.stdout or "").strip()
    except subprocess.TimeoutExpired:
        return ""


def section(t):
    print(f"\n{'='*60}\n{t}\n{'='*60}")


# ---- 1. 로컬 APK 내부에 x86 폴더가 있는가 ----
section("1. 로컬 APK의 lib 폴더 구조")
if not os.path.exists(LOCAL_APK):
    print(f"  ❌ 파일 없음: {LOCAL_APK}")
    print("  → LOCAL_APK 경로를 실제 APK 경로로 수정하세요")
else:
    import zipfile
    with zipfile.ZipFile(LOCAL_APK) as zf:
        libs = [n for n in zf.namelist() if n.startswith("lib/")]
    if libs:
        # 아키텍처별 그룹
        by_arch = {}
        for n in libs:
            parts = n.split("/")
            if len(parts) >= 3:
                arch = parts[1]
                by_arch.setdefault(arch, []).append(parts[-1])
        for arch in sorted(by_arch.keys()):
            print(f"\n  [{arch}]")
            for f in sorted(by_arch[arch]):
                print(f"    {f}")
    else:
        print("  ❌ APK에 lib 폴더가 없음!")

# ---- 2. 기기에 설치된 APK의 실제 경로 ----
section("2. 설치된 APK의 위치")
print(f"  {adb(f'shell pm path {APP_PKG}')}")

# ---- 3. 설치된 앱의 lib 폴더 구조 ----
section("3. 설치된 앱의 lib 폴더 구조")
app_dir = adb(f"shell pm path {APP_PKG}")
if ":" in app_dir:
    base = app_dir.split(":", 1)[1].strip()
    folder = base.rsplit("/", 1)[0]
    print(f"  앱 폴더: {folder}")
    out = adb(f"shell ls -la {folder}/lib/")
    print(f"  [lib/ 하위]")
    print(out)
    for arch in ["x86", "arm", "armeabi", "armeabi-v7a", "arm64-v8a"]:
        o = adb(f"shell ls -la {folder}/lib/{arch}/ 2>/dev/null")
        if o and "No such" not in o:
            print(f"\n  [{arch}/]")
            print(o)

# ---- 4. 앱 서명 확인 ----
section("4. 설치된 앱 서명과 로컬 APK 서명 비교")
sig_dev = adb(f"shell dumpsys package {APP_PKG} | grep -A2 'signatures'")
print(f"  [기기 서명]")
print(sig_dev)

if os.path.exists(LOCAL_APK):
    print(f"\n  [로컬 APK 서명]")
    # apksigner 또는 jarsigner 사용
    apksigner = r"C:\Android\sdk\build-tools\34.0.0\apksigner.bat"
    if os.path.exists(apksigner):
        r = subprocess.run([apksigner, "verify", "--print-certs", LOCAL_APK],
                           capture_output=True, text=True, errors="replace")
        print(r.stdout or r.stderr)
    else:
        print("  (apksigner 없음 - 수동 확인 필요)")

# ---- 5. 앱 설치 시각 ----
section("5. 앱 설치 시각")
out = adb(f"shell dumpsys package {APP_PKG} | grep -E 'firstInstallTime|lastUpdateTime'")
print(out)