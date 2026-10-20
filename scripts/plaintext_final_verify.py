import sqlite3
conn = sqlite3.connect('plaintext_final.db')
cur = conn.cursor()

# 1. 무결성 검사
cur.execute("PRAGMA integrity_check;")
print(cur.fetchone())

# 2. 인덱스 상태
cur.execute("PRAGMA index_list(pyojae);")
print("pyojae 인덱스:", cur.fetchall())

# 3. 외래키 관계 검증
cur.execute("SELECT COUNT(*) FROM pyojae_syn WHERE p_no2 NOT IN (SELECT _id FROM pyojae);")
print("깨진 유의어 참조:", cur.fetchone()[0])

# 4. 한글 데이터 샘플
cur.execute("SELECT pyojae_name, mean FROM pyojae WHERE pyojae_name LIKE '제언%';")
for row in cur.fetchall()[:5]:
    print(row)

# 5. 하이퍼링크 대상 검증 - 실제 유의어 체인
cur.execute("""
    SELECT p1.pyojae_name, p2.pyojae_name 
    FROM pyojae_syn s 
    JOIN pyojae p1 ON s.p_no = p1._id 
    JOIN pyojae p2 ON s.p_no2 = p2._id 
    LIMIT 5
""")
print("유의어 체인 샘플:")
for row in cur.fetchall():
    print(f"  {row[0]} → {row[1]}")