import os
import zipfile
import shutil

# ============================================================
# 설정
# ============================================================
AAR_PATH = r"C:\Users\moimerc\Downloads\Downloads\android-database-sqlcipher-3.3.1.aar"
OUTPUT_DIR = r"C:\Users\moimerc\ATELIER\Wordnet_project\x86_libs"

TARGET_FILES = [
    "libsqlcipher_android.so",
    "libdatabase_sqlcipher.so",
    "libstlport_shared.so",
]

TARGET_ARCH = "x86"  # LDPlayer용


def main():
    print(f"AAR: {AAR_PATH}")
    print(f"출력: {OUTPUT_DIR}\\{TARGET_ARCH}\\")
    print("=" * 60)

    # 출력 폴더 준비
    out_arch_dir = os.path.join(OUTPUT_DIR, TARGET_ARCH)
    os.makedirs(out_arch_dir, exist_ok=True)

    extracted = []
    missing = []

    with zipfile.ZipFile(AAR_PATH, 'r') as zf:
        # AAR 내 모든 항목 나열
        all_names = zf.namelist()

        for target in TARGET_FILES:
            # jni/x86/libXXX.so 경로 찾기
            candidate = f"jni/{TARGET_ARCH}/{target}"
            if candidate in all_names:
                out_path = os.path.join(out_arch_dir, target)
                with zf.open(candidate) as src, open(out_path, "wb") as dst:
                    shutil.copyfileobj(src, dst)
                size = os.path.getsize(out_path)
                print(f"✅ 추출: {target}  ({size:,} bytes)")
                extracted.append(target)
            else:
                print(f"❌ 없음: {candidate}")
                missing.append(target)

    print("\n" + "=" * 60)
    if not missing:
        print(f"🎉 성공! {len(extracted)}개 파일 모두 추출됨")
        print(f"\n배치 경로: {out_arch_dir}")
        print("\n이제 이 폴더를 APK의 lib/ 안에 넣으면 됩니다:")
        print(f"  APK: lib/armeabi/ (원본)")
        print(f"  APK: lib/x86/     (새로 추가)")

        # 파일 검증: ELF 헤더 확인
        print("\n[ELF 헤더 확인 (x86 여부 검증)]")
        for target in extracted:
            path = os.path.join(out_arch_dir, target)
            with open(path, "rb") as f:
                magic = f.read(20)
            # ELF magic: 7f 45 4c 46
            if magic[:4] == b'\x7fELF':
                # e_machine: offset 18, little-endian
                e_machine = int.from_bytes(magic[18:20], "little")
                arch_names = {
                    0x03: "x86 (i386)",
                    0x28: "ARM (32-bit)",
                    0x3E: "x86_64",
                    0xB7: "ARM64",
                }
                arch = arch_names.get(e_machine, f"unknown (0x{e_machine:04x})")
                print(f"  {target}: {arch}")
            else:
                print(f"  {target}: ELF 아님 (이상함!)")
    else:
        print(f"⚠️ {len(missing)}개 파일 누락: {missing}")


if __name__ == "__main__":
    main()