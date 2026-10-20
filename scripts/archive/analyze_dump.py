import os
import struct

DUMP_PATH = r"C:\Users\moimerc\ATELIER\Wordnet_project\heap_dump.bin"
PAGE1_OFFSET = 0xf488420
PAGE_SIZE = 1024
PAGE_COUNT = 44480
OUT_DIR = r"C:\Users\moimerc\ATELIER\Wordnet_project"


def read_varint(data, offset):
    """SQLite varint 파싱"""
    result = 0
    for i in range(9):
        if offset + i >= len(data):
            return (None, 0)
        b = data[offset + i]
        if i == 8:
            result = (result << 8) | b
            return (result, 9)
        result = (result << 7) | (b & 0x7f)
        if not (b & 0x80):
            return (result, i + 1)
    return (None, 0)


def parse_page1(data, offset):
    """페이지 1에서 스키마 레코드 추출"""
    header = data[offset:offset+100]
    if header[:16] != b"SQLite format 3\x00":
        print("페이지 1이 아님")
        return None

    page_size = struct.unpack(">H", header[16:18])[0]
    if page_size == 1:
        page_size = 65536
    db_size = struct.unpack(">I", header[28:32])[0]
    text_encoding = struct.unpack(">I", header[56:60])[0]

    print(f"페이지 크기: {page_size}")
    print(f"DB 페이지 수: {db_size}")
    print(f"텍스트 인코딩: {text_encoding} (1=UTF-8, 2=UTF-16le, 3=UTF-16be)")

    # 페이지 1의 b-tree 헤더는 offset+100부터
    btree_offset = offset + 100
    page_type = data[btree_offset]
    print(f"페이지 1 b-tree 타입: 0x{page_type:02x}")

    cell_count = struct.unpack(">H", data[btree_offset+3:btree_offset+5])[0]
    print(f"페이지 1 셀 개수: {cell_count}")

    # 셀 포인터 배열
    cell_pointers = []
    for i in range(cell_count):
        ptr = struct.unpack(">H", data[btree_offset+8+i*2:btree_offset+10+i*2])[0]
        cell_pointers.append(ptr)

    # 각 셀 파싱
    schema_records = []
    for ptr in cell_pointers:
        cell_off = btree_offset + ptr
        # payload length varint, rowid varint
        payload_len, n1 = read_varint(data, cell_off)
        rowid, n2 = read_varint(data, cell_off + n1)
        payload_start = cell_off + n1 + n2
        payload = data[payload_start:payload_start + payload_len]

        # 레코드: 컬럼 개수 varint + serial types + 데이터
        n_cols, nc = read_varint(payload, 0)
        serial_types = []
        off = nc
        for _ in range(n_cols):
            st, sz = read_varint(payload, off)
            serial_types.append(st)
            off += sz

        # 각 컬럼 값 추출
        values = []
        for st in serial_types:
            if st == 0:
                values.append(None)
            elif st == 1:
                values.append(int.from_bytes(payload[off:off+1], 'big', signed=True))
                off += 1
            elif st == 2:
                values.append(int.from_bytes(payload[off:off+2], 'big', signed=True))
                off += 2
            elif st == 3:
                values.append(int.from_bytes(payload[off:off+3], 'big', signed=True))
                off += 3
            elif st == 4:
                values.append(int.from_bytes(payload[off:off+4], 'big', signed=True))
                off += 4
            elif st == 5:
                values.append(int.from_bytes(payload[off:off+6], 'big', signed=True))
                off += 6
            elif st == 6:
                values.append(int.from_bytes(payload[off:off+8], 'big', signed=True))
                off += 8
            elif st == 7:
                values.append(struct.unpack(">d", payload[off:off+8])[0])
                off += 8
            elif st == 8:
                values.append(0)
            elif st == 9:
                values.append(1)
            elif st >= 12 and st % 2 == 0:
                length = (st - 12) // 2
                values.append(payload[off:off+length].decode('utf-8', errors='replace'))
                off += length
            elif st >= 13 and st % 2 == 1:
                length = (st - 13) // 2
                values.append(payload[off:off+length].decode('utf-16-be', errors='replace'))
                off += length
            else:
                values.append(f"<unknown serial {st}>")

        schema_records.append((rowid, values))

    return schema_records


def scan_for_pages(data, page_size):
    """덤프 전체에서 b-tree 페이지처럼 보이는 오프셋 스캔"""
    leaf_table = 0x0d
    leaf_index = 0x0a
    interior_table = 0x05
    interior_index = 0x02

    candidates = []
    total = len(data)
    # 최소 8바이트는 b-tree 헤더가 있어야 함
    for off in range(0, total - page_size):
        first = data[off]
        if first not in (leaf_table, leaf_index, interior_table, interior_index):
            continue
        # 최소한의 유효성 검사
        first_freeblock = struct.unpack(">H", data[off+1:off+3])[0]
        cell_count = struct.unpack(">H", data[off+3:off+5])[0]
        cell_content_start = struct.unpack(">H", data[off+5:off+7])[0]

        if cell_count == 0 or cell_count > 800:
            continue
        if cell_content_start < 8 or cell_content_start > page_size:
            continue
        if first_freeblock != 0 and (first_freeblock < 8 or first_freeblock > page_size):
            continue
        # 셀 포인터 배열이 페이지 경계 안에 있어야 함
        if 8 + cell_count * 2 > page_size:
            continue

        candidates.append((off, first, cell_count, cell_content_start))

    return candidates


def main():
    print(f"덤프 로딩 중...")
    with open(DUMP_PATH, 'rb') as f:
        data = f.read()
    print(f"덤프 크기: {len(data)} bytes ({len(data)/1024/1024:.1f} MB)\n")

    print("=" * 60)
    print("페이지 1 파싱")
    print("=" * 60)
    schema_records = parse_page1(data, PAGE1_OFFSET)
    if schema_records:
        print(f"\n스키마 레코드 {len(schema_records)}개:")
        for rowid, values in schema_records:
            print(f"\n  [rowid={rowid}]")
            for i, v in enumerate(values):
                if isinstance(v, str) and len(v) > 200:
                    v = v[:200] + "..."
                print(f"    [{i}] {v!r}")

    print("\n" + "=" * 60)
    print(f"덤프 전체 스캔 (페이지 크기 {PAGE_SIZE})")
    print("=" * 60)
    candidates = scan_for_pages(data, PAGE_SIZE)
    print(f"후보 페이지: {len(candidates)}개")

    # 타입별 카운트
    from collections import Counter
    type_counter = Counter(c[1] for c in candidates)
    print("\n타입별:")
    for t, cnt in type_counter.most_common():
        type_names = {0x0d: 'table_leaf', 0x0a: 'index_leaf',
                      0x05: 'table_interior', 0x02: 'index_interior'}
        print(f"  0x{t:02x} ({type_names.get(t, '?')}): {cnt}개")

    # table_leaf 페이지들만 오프셋 저장
    leaf_offsets = [c[0] for c in candidates if c[1] == 0x0d]
    print(f"\ntable_leaf 오프셋 {len(leaf_offsets)}개를 파일로 저장...")
    out_file = os.path.join(OUT_DIR, "table_leaf_offsets.txt")
    with open(out_file, "w") as f:
        for off in leaf_offsets:
            f.write(f"{off}\n")
    print(f"저장됨: {out_file}")

    # 인덱스 leaf 오프셋
    index_leaf_offsets = [c[0] for c in candidates if c[1] == 0x0a]
    out_file2 = os.path.join(OUT_DIR, "index_leaf_offsets.txt")
    with open(out_file2, "w") as f:
        for off in index_leaf_offsets:
            f.write(f"{off}\n")
    print(f"저장됨: {out_file2}")


if __name__ == "__main__":
    main()