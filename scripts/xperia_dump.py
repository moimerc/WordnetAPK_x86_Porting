import subprocess
import os
import sys
import time

ADB = "adb"
APP_PKG = "com.wordnet.dic.synonym"
SDCARD_DUMP = "/sdcard/heap_dump.bin"
LOCAL_DUMP = r"C:\Users\moimerc\ATELIER\Wordnet_project\heap_dump.bin"


def run(cmd, use_shell=True):
    result = subprocess.run(cmd, shell=use_shell, capture_output=True, text=True, errors='replace')
    return result.stdout, result.stderr


def adb_shell(cmd, su=False):
    if su:
        full = f'{ADB} shell su -c "{cmd}"'
    else:
        full = f'{ADB} shell {cmd}'
    return run(full)


def step(msg):
    print(f"\n=== {msg} ===", flush=True)


def main():
    step("1. 앱 데이터 디렉토리 조사")
    out, _ = adb_shell(f"ls -la /data/data/{APP_PKG}/", su=True)
    print(out)

    step("2. cache 및 files 디렉토리")
    for sub in ["cache", "files", "databases", "shared_prefs"]:
        out, _ = adb_shell(f"ls -laR /data/data/{APP_PKG}/{sub}/", su=True)
        print(f"--- {sub} ---")
        print(out if out else "(없음)")

    step("3. SD카드 DB 폴더")
    out, _ = adb_shell("ls -la /sdcard/DIC_SYNONYM/")
    print(out)

    step("4. 앱 실행 여부 확인")
    out, _ = adb_shell(f"pidof {APP_PKG}")
    pid = out.strip()
    if not pid:
        print("앱이 실행 중이 아닙니다. Xperia A에서 앱을 열고 여러 번 검색한 뒤 다시 실행하세요.")
        return 1
    print(f"PID: {pid}")

    step("5. 메모리 맵 확인")
    out, _ = adb_shell(f"cat /proc/{pid}/maps", su=True)
    rw_p_regions = []
    total = 0
    for line in out.split("\n"):
        parts = line.split()
        if len(parts) >= 2 and parts[1] == "rw-p":
            try:
                start, end = parts[0].split("-")
                start_int = int(start, 16)
                end_int = int(end, 16)
                size = end_int - start_int
                if size > 0:
                    rw_p_regions.append((start_int, end_int))
                    total += size
            except ValueError:
                pass

    print(f"RW-P 영역 개수: {len(rw_p_regions)}")
    print(f"총 크기: {total / 1024 / 1024:.1f} MB")

    step("6. 메모리 덤프 시작 (몇 분 소요)")
    # 기기에서 실행할 스크립트 작성
    dump_script = f"""
PID={pid}
OUT={SDCARD_DUMP}
rm -f $OUT
cat /proc/$PID/maps | while read line; do
    perm=$(echo $line | awk '{{print $2}}')
    if [ "$perm" = "rw-p" ]; then
        range=$(echo $line | awk '{{print $1}}')
        start=$(echo $range | cut -d- -f1)
        end=$(echo $range | cut -d- -f2)
        start_dec=$((16#$start))
        end_dec=$((16#$end))
        size=$((end_dec - start_dec))
        if [ $size -gt 0 ]; then
            dd if=/proc/$PID/mem bs=4096 skip=$((start_dec/4096)) count=$((size/4096+1)) 2>/dev/null >> $OUT
        fi
    fi
done
ls -la $OUT
"""
    # 기기로 스크립트 전송 및 실행
    script_local = r"C:\Users\moimerc\ATELIER\Wordnet_project\dump_on_device.sh"
    with open(script_local, "w", newline="\n") as f:
        f.write(dump_script)

    adb_shell("rm /data/local/tmp/dump.sh")
    run(f'{ADB} push "{script_local}" /data/local/tmp/dump.sh')
    adb_shell("chmod 755 /data/local/tmp/dump.sh")
    print("덤프 실행 중... (인내심 필요)")
    out, err = adb_shell("sh /data/local/tmp/dump.sh", su=True)
    print(out)
    if err:
        print(f"stderr: {err}")

    step("7. PC로 가져오기")
    run(f'{ADB} pull {SDCARD_DUMP} "{LOCAL_DUMP}"')
    if os.path.exists(LOCAL_DUMP):
        size = os.path.getsize(LOCAL_DUMP)
        print(f"덤프 파일: {LOCAL_DUMP} ({size / 1024 / 1024:.1f} MB)")
    else:
        print("덤프 파일을 가져오지 못했습니다.")
        return 1

    step("8. SQLite 시그니처 검색")
    with open(LOCAL_DUMP, "rb") as f:
        data = f.read()
    signature = b"SQLite format 3\x00"
    positions = []
    idx = 0
    while True:
        idx = data.find(signature, idx)
        if idx < 0:
            break
        positions.append(idx)
        idx += 1

    print(f"'SQLite format 3' 시그니처 발견 횟수: {len(positions)}")
    for pos in positions[:20]:
        print(f"  offset 0x{pos:x} ({pos})")

    if not positions:
        print("복호화된 페이지가 메모리에 없습니다.")
        print("앱을 열고 여러 검색을 수행한 뒤 다시 실행하세요.")
        return 1

    return 0


if __name__ == "__main__":
    sys.exit(main())