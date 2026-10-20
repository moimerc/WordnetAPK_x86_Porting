import os
import struct
import sqlite3
from collections import defaultdict

DUMP_PATH = r"C:\Users\moimerc\ATELIER\Wordnet_project\heap_dump.bin"
PAGE1_OFFSET = 0xf488420
PAGE_SIZE = 1024
OUT_DIR = r"C:\Users\moimerc\ATELIER\Wordnet_project"


def read_varint(data, offset, max_len=9):
    result = 0
    for i in range(max_len):
        if offset + i >= len(data):
            return (None, 0)
        b = data[offset + i]
        result = (result << 7) | (b & 0x7f)
        if not (b & 0x80):
            return (result, i + 1)
    return (None, 0)


def parse_record(payload):
    """SQLite 레코드 파싱 → 값 리스트 반환"""
    if not payload:
        return None
    n_cols, nc = read_varint(payload, 0)
    if n_cols is None or n_cols > 100:
        return None
    serial_types = []
    off = nc
    for _ in range(n_cols):
        st, sz = read_varint(payload, off)
        if st is None:
            return None
        serial_types.append(st)
        off += sz

    values = []
    for st in serial_types:
        try:
            if st == 0:
                values.append(None)
            elif st == 1:
                values.append(int.from_bytes(payload[off:off+1], 'big', signed=True)); off += 1
            elif st == 2:
                values.append(int.from_bytes(payload[off:off+2], 'big', signed=True)); off += 2
            elif st == 3:
                values.append(int.from_bytes(payload[off:off+3], 'big', signed=True)); off += 3
            elif st == 4:
                values.append(int.from_bytes(payload[off:off+4], 'big', signed=True)); off += 4
            elif st == 5:
                values.append(int.from_bytes(payload[off:off+6], 'big', signed=True)); off += 6
            elif st == 6:
                values.append(int.from_bytes(payload[off:off+8], 'big', signed=True)); off += 8
            elif st == 7:
                values.append(struct.unpack(">d", payload[off:off+8])[0]); off += 8
            elif st == 8:
                values.append(0)
            elif st == 9:
                values.append(1)
            elif st >= 12 and st % 2 == 0:
                ln = (st - 12) // 2
                values.append(payload[off:off+ln]); off += ln  # BLOB으로 유지
            elif st >= 13 and st % 2 == 1:
                ln = (st - 13) // 2
                raw = payload[off:off+ln]
                try:
                    values.append(raw.decode('utf-8'))
                except UnicodeDecodeError:
                    try:
                        values.append(raw.decode('utf-16-be'))
                    except Exception:
                        values.append(raw)
                off += ln
            else:
                values.append(f"<st={st}>")
        except Exception:
            return None
    return values


def parse_leaf_page(data, offset, page_size):
    """table_leaf 페이지 파싱 → (rowid, values) 리스트"""
    page_type = data[offset]
    if page_type != 0x0d:
        return []
    cell_count = struct.unpack(">H", data[offset+3:offset+5])[0]
    if cell_count == 0 or cell_count > 800:
        return []
    cell_ptrs = []
    for i in range(cell_count):
        p = offset + 8 + i*2
        if p + 2 > len(data):
            break
        ptr = struct.unpack(">H", data[p:p+2])[0]
        if ptr < 8 or ptr >= page_size:
            return []
        cell_ptrs.append(ptr)

    records = []
    for ptr in cell_ptrs:
        cell_off = offset + ptr
        payload_len, n1 = read_varint(data, cell_off)
        if payload_len is None:
            continue
        rowid, n2 = read_varint(data, cell_off + n1)
        if rowid is None:
            continue
        payload_start = cell_off + n1 + n2

        # overflow 페이지 처리 생략 (간단화). 필요 시 확장.
        if payload_len > page_size - ptr - n1 - n2:
            continue

        payload = data[payload_start:payload_start + payload_len]
        values = parse_record(payload)
        if values is not None:
            records.append((rowid, values))
    return records


def find_schema_records(data, leaf_offsets):
    """leaf 페이지들 중에서 스키마 레코드를 포함한 것들 추출"""
    schema_records = []
    for off in leaf_offsets:
        if off + PAGE_SIZE > len(data):
            continue
        recs = parse_leaf_page(data, off, PAGE_SIZE)
        for rowid, values in recs:
            # 스키마 레코드 패턴: 5 컬럼, 첫 컬럼이 'table' 또는 'index'
            if len(values) >= 5 and isinstance(values[0], str) and values[0] in ('table', 'index', 'view', 'trigger'):
                schema_records.append((off, rowid, values))
    return schema_records


def main():
    print("덤프 로딩...")
    with open(DUMP_PATH, 'rb') as f:
        data = f.read()
    print(f"크기: {len(data)/1024/1024:.1f} MB\n")

    # leaf 오프셋 로드
    with open(os.path.join(OUT_DIR, "table_leaf_offsets.txt")) as f:
        leaf_offsets = [int(line.strip()) for line in f if line.strip()]
    print(f"table_leaf 오프셋 {len(leaf_offsets)}개 로드\n")

    print("=" * 60)
    print("스키마 레코드 검색")
    print("=" * 60)
    schema = find_schema_records(data, leaf_offsets)
    print(f"스키마 레코드 {len(schema)}개 발견\n")

    # 중복 제거 (rowid 기준)
    seen = {}
    for off, rowid, values in schema:
        if rowid not in seen:
            seen[rowid] = values
    unique_schema = sorted(seen.items())

    print(f"고유 스키마 레코드: {len(unique_schema)}개\n")
    for rowid, values in unique_schema:
        print(f"[rowid={rowid}]")
        for i, v in enumerate(values):
            if isinstance(v, bytes):
                v = f"<BLOB {len(v)}bytes>"
            if isinstance(v, str) and len(v) > 300:
                v = v[:300] + "..."
            print(f"   [{i}] {v!r}")
        print()

    # 각 테이블별 컬럼 수 파악 (스키마의 sql에서 CREATE TABLE 파싱 가능하지만
    # 컬럼 수를 데이터에서 추정)
    # 그룹화: leaf 페이지들 중 컬럼 수가 같은 것들끼리
    print("=" * 60)
    print("leaf 페이지들의 컬럼 수 분포 (테이블 추정)")
    print("=" * 60)
    col_count_dist = defaultdict(int)
    col_examples = {}
    for off in leaf_offsets:
        if off + PAGE_SIZE > len(data):
            continue
        recs = parse_leaf_page(data, off, PAGE_SIZE)
        for rowid, values in recs:
            n = len(values)
            col_count_dist[n] += 1
            if n not in col_examples:
                col_examples[n] = values

    for n in sorted(col_count_dist.keys()):
        print(f"\n컬럼 {n}개: {col_count_dist[n]}개 레코드")
        if n in col_examples:
            ex = col_examples[n]
            print(f"  예시: {[str(v)[:50] if v is not None else None for v in ex]}")


if __name__ == "__main__":
    main()