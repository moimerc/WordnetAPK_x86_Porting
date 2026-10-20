import subprocess
import os

WORK_DIR = r"C:\Users\moimerc\ATELIER\Wordnet_project"
SQLCIPHER = os.path.join(WORK_DIR, "sqlcipher.exe")
DB_FILE = ".dicPyojaeEnc20140812.db"
PASSWORD = "papa@leave3463"
OUT_FILE = "plaintext_dic_final.db"

os.chdir(WORK_DIR)

def try_decrypt(compat):
    sql = f"""PRAGMA cipher_compatibility = {compat};
PRAGMA key = '{PASSWORD}';
SELECT count(*) FROM sqlite_master;
.quit
"""
    res = subprocess.run([SQLCIPHER, DB_FILE], input=sql, capture_output=True, text=True, encoding="utf-8", errors="replace")
    out = (res.stdout or "") + (res.stderr or "")
    
    for line in out.split('\n'):
        if line.strip().isdigit():
            return True, int(line.strip())
    return False, 0

print(f"[*] 진짜 비밀번호 '{PASSWORD}' 로 복호화를 시도합니다...")

success_compat = None
for compat in [1, 2, 3, 4]:
    is_ok, count = try_decrypt(compat)
    if is_ok:
        print(f"✅ 일치하는 버전 찾음: cipher_compatibility = {compat} (테이블 수: {count})")
        success_compat = compat
        break

if success_compat:
    print(f"[*] 평문 DB({OUT_FILE}) 추출 중...")
    export_sql = f"""PRAGMA cipher_compatibility = {success_compat};
PRAGMA key = '{PASSWORD}';
ATTACH DATABASE '{OUT_FILE}' AS plaintext KEY '';
SELECT sqlcipher_export('plaintext');
DETACH DATABASE plaintext;
.quit
"""
    subprocess.run([SQLCIPHER, DB_FILE], input=export_sql, capture_output=True, text=True)
    
    if os.path.exists(OUT_FILE) and os.path.getsize(OUT_FILE) > 0:
        print(f"🎉 성공! 평문 DB가 저장되었습니다: {OUT_FILE} ({os.path.getsize(OUT_FILE):,} bytes)")
    else:
        print("[!] 추출 실패. 파일이 생성되지 않았습니다.")
else:
    print("❌ 표준 버전(1~4)으로 열리지 않습니다. KDF/PageSize 추가 조합 확인이 필요합니다.")