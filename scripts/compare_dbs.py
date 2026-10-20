import sqlite3
import os

DB1 = 'plaintext_final.db'   # Frida (41,951,232)
DB2 = 'plaintext_dic.db'     # PC sqlcipher (40,378,368)

def stats(path):
    conn = sqlite3.connect(path)
    cur = conn.cursor()
    result = {"file": path, "size": os.path.getsize(path)}
    for pragma in ["page_size", "page_count", "freelist_count"]:
        cur.execute(f"PRAGMA {pragma};")
        result[pragma] = cur.fetchone()[0]
    for table in ["pyojae", "pyojae_syn", "pyojae_ant"]:
        cur.execute(f"SELECT count(*) FROM {table};")
        result[table] = cur.fetchone()[0]
    conn.close()
    return result

print(f"{'항목':<20} {'final':>15} {'dic':>15} {'차이':>15}")
print("=" * 70)
s1 = stats(DB1)
s2 = stats(DB2)
for key in ["size", "page_size", "page_count", "freelist_count",
            "pyojae", "pyojae_syn", "pyojae_ant"]:
    v1, v2 = s1.get(key), s2.get(key)
    diff = v1 - v2 if isinstance(v1, int) and isinstance(v2, int) else "N/A"
    print(f"{key:<20} {v1:>15} {v2:>15} {diff:>15}")

# VACUUM 후 dic 크기 재측정 제안
print("\n[dic DB를 VACUUM하면 크기가 줄어들 수 있음]")