import os
import struct
import sqlite3

DUMP_PATH = r"C:\Users\moimerc\ATELIER\Wordnet_project\heap_dump.bin"
OUT_DIR = r"C:\Users\moimerc\ATELIER\Wordnet_project"

with open(DUMP_PATH, 'rb') as f:
    data = f.read()

print(f"덤프 크기: {len(data)} bytes ({len(data)/1024/1024:.1f} MB)")

signature = b"SQLite format 3\x00"
positions = []
idx = 0
while True:
    idx = data.find(signature, idx)
    if idx < 0:
        break
    positions.append(idx)
    idx += 1

print(f"\n시그니처 {len(positions)}개 발견\n")

for i, pos in enumerate(positions):
    print(f"=== 시그니처 #{i}: offset 0x{pos:x} ({pos}) ===")

    if pos + 100 > len(data):
        print("  데이터 부족")
        continue

    # 페이지 크기 (big-endian, 1이면 65536)
    page_size = struct.unpack(">H", data[pos+16:pos+18])[0]
    if page_size == 1:
        page_size = 65536

    # DB 크기 (페이지 수)
    db_size_pages = struct.unpack(">I", data[pos+28:pos+32])[0]

    # 파일 체인지 카운터
    change_counter = struct.unpack(">I", data[pos+24:pos+28])[0]

    print(f"  페이지 크기: {page_size}")
    print(f"  체인지 카운터: {change_counter}")
    print(f"  DB 페이지 수: {db_size_pages}")
    print(f"  예상 DB 크기: {db_size_pages * page_size / 1024 / 1024:.2f} MB")

    # 1) 시그니처부터 연속 블록 추출 시도
    expected_size = db_size_pages * page_size
    if pos + expected_size <= len(data):
        chunk = data[pos:pos + expected_size]
        out_contig = os.path.join(OUT_DIR, f"dump_contig_{i}.db")
        with open(out_contig, "wb") as f:
            f.write(chunk)
        print(f"  연속 블록 추출: {out_contig} ({len(chunk)/1024/1024:.1f} MB)")

        # sqlite3로 열어보기
        try:
            conn = sqlite3.connect(f"file:{out_contig}?mode=ro", uri=True)
            cur = conn.cursor()
            cur.execute("SELECT count(*) FROM sqlite_master;")
            master_count = cur.fetchone()[0]
            print(f"  ✅ sqlite_master 행 수: {master_count}")

            cur.execute("SELECT type, name FROM sqlite_master LIMIT 20;")
            for row in cur.fetchall():
                print(f"     {row[0]}: {row[1]}")

            cur.execute("PRAGMA integrity_check;")
            integ = cur.fetchone()[0]
            print(f"  무결성: {integ}")
            conn.close()

            print(f"  🎉 완전한 DB 복원 성공!")
        except Exception as e:
            print(f"  ⚠️ sqlite3 열기 실패: {e}")
            print(f"     (페이지가 메모리에서 흩어져 있을 가능성)")

    else:
        # 남은 만큼만 추출
        chunk = data[pos:]
        out_partial = os.path.join(OUT_DIR, f"dump_partial_{i}.db")
        with open(out_partial, "wb") as f:
            f.write(chunk)
        print(f"  ⚠️ 데이터 부족. 부분 추출: {out_partial} ({len(chunk)/1024/1024:.1f} MB)")

    # 2) b-tree 페이지 스캔 (개별 페이지 재조립용)
    print(f"  주변 데이터 스캔 중...")
    # 페이지 크기 단위로 근처 데이터 확인
    # 시그니처 다음 페이지가 유효한지 확인
    if pos + page_size * 2 <= len(data):
        next_page_offset = pos + page_size
        first_byte = data[next_page_offset]
        # b-tree 페이지 타입: 0x02, 0x05, 0x0a, 0x0d
        if first_byte in (0x02, 0x05, 0x0a, 0x0d):
            print(f"  ✅ 페이지 2로 보이는 데이터 발견 (type=0x{first_byte:02x})")
        else:
            print(f"  ⚠️ 페이지 2 위치에 b-tree 헤더 없음 (0x{first_byte:02x})")

    print()

print("\n=== 완료 ===")