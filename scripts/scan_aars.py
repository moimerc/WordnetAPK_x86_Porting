import os
import zipfile
import glob

# ============================================================
# 설정
# ============================================================
AAR_DIR = r"C:\Users\moimerc\Downloads\Downloads"
OUTPUT_FILE = r"C:\Users\moimerc\ATELIER\Wordnet_project\aar_scan_result.txt"

TARGET_FILES = [
    "libsqlcipher_android.so",
    "libdatabase_sqlcipher.so",
    "libstlport_shared.so",
]


def scan_aar(aar_path):
    """AAR 하나를 스캔하여 (아키텍처별 .so 위치) 반환"""
    result = {
        "path": aar_path,
        "name": os.path.basename(aar_path),
        "size": os.path.getsize(aar_path),
        "architectures": {},  # {arch: [so_files]}
        "has_jni": False,
        "error": None,
    }

    try:
        with zipfile.ZipFile(aar_path, 'r') as zf:
            names = zf.namelist()
            for name in names:
                # jni/ 폴더 내의 .so 파일만
                if not name.startswith("jni/") or not name.endswith(".so"):
                    continue
                result["has_jni"] = True
                parts = name.split("/")
                if len(parts) >= 3:
                    arch = parts[1]  # jni/<arch>/xxx.so
                    so_file = parts[-1]
                    result["architectures"].setdefault(arch, []).append(so_file)
    except Exception as e:
        result["error"] = str(e)

    return result


def main():
    aar_files = sorted(glob.glob(os.path.join(AAR_DIR, "*.aar")))
    if not aar_files:
        print(f"AAR 파일을 찾을 수 없음: {AAR_DIR}")
        return

    print(f"AAR 파일 {len(aar_files)}개 발견\n")
    print("=" * 80)

    lines_out = []
    def out(s=""):
        print(s)
        lines_out.append(s)

    best_matches = []  # (aar_name, arch, [target files found])

    for aar_path in aar_files:
        info = scan_aar(aar_path)
        out(f"\n[FILE] {info['name']}  ({info['size']:,} bytes)")

        if info["error"]:
            out(f"  ❌ 오류: {info['error']}")
            continue

        if not info["has_jni"]:
            out(f"  ⚠️  jni 폴더 없음 (ARM 미지원 라이브러리)")
            continue

        for arch, so_list in sorted(info["architectures"].items()):
            so_list_sorted = sorted(so_list)
            marker = ""

            # 타겟 파일 몇 개가 있는지 확인
            found_targets = [f for f in TARGET_FILES if f in so_list]
            if found_targets:
                marker = f"  ← 🎯 타겟 {len(found_targets)}/3"

            out(f"  [{arch}] {len(so_list)}개 .so{marker}")
            for so in so_list_sorted:
                is_target = "★" if so in TARGET_FILES else " "
                out(f"    {is_target} {so}")

            # x86이고 타겟 파일이 있으면 best_matches에 추가
            if arch in ("x86", "x86_64") and found_targets:
                best_matches.append((info["name"], arch, found_targets))

    out("\n" + "=" * 80)
    out("\n[요약] x86/x86_64 아키텍처에 타겟 .so 파일이 있는 AAR:")

    if not best_matches:
        out("  ❌ 없음. 이 버전들 중에는 x86 지원이 없음.")
        out("\n  대안:")
        out("    1) 더 오래된 버전(3.2.x, 3.1.x) 시도")
        out("    2) 또는 다른 배포처(예: GitHub 릴리즈, APKMirror)")
        out("    3) 또는 SQLCipher를 직접 크로스 컴파일")
    else:
        for name, arch, targets in best_matches:
            out(f"  ✅ {name}  [{arch}]")
            out(f"       발견: {', '.join(targets)}")

        out(f"\n  총 {len(best_matches)}개의 AAR이 x86을 지원합니다.")
        out(f"\n  [다음 단계]")
        out(f"  가장 높은 버전의 AAR을 선택하여 jni/x86 폴더를 추출하세요.")

    # 파일로 저장
    try:
        with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
            f.write("\n".join(lines_out))
        print(f"\n결과 저장: {OUTPUT_FILE}")
    except Exception as e:
        print(f"파일 저장 실패: {e}")


if __name__ == "__main__":
    main()