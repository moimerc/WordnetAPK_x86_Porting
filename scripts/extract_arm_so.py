import os
import zipfile
import shutil

AAR_PATH = r"C:\Users\moimerc\Downloads\Downloads\android-database-sqlcipher-3.4.0.aar"
OUTPUT_DIR = r"C:\Users\moimerc\ATELIER\arm_libs"

TARGET_FILES = [
    "libsqlcipher_android.so",
    "libdatabase_sqlcipher.so",
    "libstlport_shared.so",
]

# 폰 ABI: arm64-v8a, armeabi-v7a, armeabi → armeabi-v7a 사용
TARGET_ARCH = "armeabi-v7a"


def main():
    out_arch_dir = os.path.join(OUTPUT_DIR, TARGET_ARCH)
    os.makedirs(out_arch_dir, exist_ok=True)

    with zipfile.ZipFile(AAR_PATH, 'r') as zf:
        for target in TARGET_FILES:
            candidate = f"jni/{TARGET_ARCH}/{target}"
            if candidate in zf.namelist():
                out_path = os.path.join(out_arch_dir, target)
                with zf.open(candidate) as src, open(out_path, "wb") as dst:
                    shutil.copyfileobj(src, dst)
                print(f"✅ {target}  ({os.path.getsize(out_path):,} bytes)")
            else:
                print(f"❌ {candidate} 없음")

    print(f"\n배치 경로: {out_arch_dir}")


if __name__ == "__main__":
    main()