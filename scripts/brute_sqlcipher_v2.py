import subprocess
import os
import hashlib
import time
import sys
from datetime import datetime

# ============================================================
# 설정
# ============================================================
WORK_DIR = r"C:\Users\moimerc\ATELIER\Wordnet_project"
SQLCIPHER = os.path.join(WORK_DIR, "sqlcipher.exe")
DB_FILE = ".dicPyojaeEnc20140812.db"
PASSWORD = "papa@leave3463"
LOG_FILE = os.path.join(WORK_DIR, "brute_log_v2.txt")

os.chdir(WORK_DIR)


def log(msg):
    line = f"[{datetime.now().strftime('%H:%M:%S')}] {msg}"
    print(line, flush=True)
    try:
        with open(LOG_FILE, "a", encoding="utf-8") as f:
            f.write(line + "\n")
    except OSError:
        pass


def try_sql(statements):
    """PRAGMA/SELECT 문 리스트 → (성공여부, 결과숫자, 원본출력)"""
    sql_text = "\n".join(statements) + "\nSELECT count(*) FROM sqlite_master;\n.quit\n"
    try:
        result = subprocess.run(
            [SQLCIPHER, DB_FILE],
            input=sql_text,
            capture_output=True,
            text=True,
            timeout=20,
            encoding="utf-8",
            errors="replace"
        )
    except subprocess.TimeoutExpired:
        return (False, None, "TIMEOUT")
    except Exception as e:
        return (False, None, str(e))

    output = (result.stdout or "") + (result.stderr or "")
    if "file is not a database" in output:
        return (False, None, output)
    if "Error:" in output:
        # count 결과 줄이 있는지 재확인
        for line in output.split("\n"):
            s = line.strip()
            if s.isdigit():
                return (True, int(s), output)
        return (False, None, output)

    for line in output.split("\n"):
        s = line.strip()
        if s.isdigit():
            return (True, int(s), output)

    return (False, None, output)


# ============================================================
# 1. 비밀번호 인코딩 변형 생성
# ============================================================
def generate_key_candidates():
    """모든 비밀번호/키 후보를 (라벨, PRAGMA key 문) 형태로 반환"""
    candidates = []

    pw_bytes_utf8 = PASSWORD.encode("utf-8")
    pw_bytes_utf16le = PASSWORD.encode("utf-16-le")
    pw_bytes_utf16be = PASSWORD.encode("utf-16-be")

    # --- Passphrase 모드 (그대로 문자열) ---
    candidates.append(("plain-utf8-passphrase", f"PRAGMA key = '{PASSWORD}';"))

    # --- 해시된 passphrase (hex 문자열) ---
    candidates.append(("md5-hex-as-passphrase",
                       f"PRAGMA key = '{hashlib.md5(pw_bytes_utf8).hexdigest()}';"))
    candidates.append(("sha1-hex-as-passphrase",
                       f"PRAGMA key = '{hashlib.sha1(pw_bytes_utf8).hexdigest()}';"))
    candidates.append(("sha256-hex-as-passphrase",
                       f"PRAGMA key = '{hashlib.sha256(pw_bytes_utf8).hexdigest()}';"))

    # --- Raw key 모드 (x'hex') — 정확히 32바이트(64 hex)여야 함 ---
    # MD5 raw (16바이트) - AES-128용
    md5_raw = hashlib.md5(pw_bytes_utf8).digest()
    candidates.append(("md5-raw-16bytes", f"PRAGMA key = \"x'{md5_raw.hex()}'\";"))

    # SHA256 raw (32바이트) - AES-256용
    sha256_raw = hashlib.sha256(pw_bytes_utf8).digest()
    candidates.append(("sha256-raw-32bytes", f"PRAGMA key = \"x'{sha256_raw.hex()}'\";"))

    # SHA256 of UTF-16LE bytes
    sha256_utf16le = hashlib.sha256(pw_bytes_utf16le).digest()
    candidates.append(("sha256-utf16le-raw", f"PRAGMA key = \"x'{sha256_utf16le.hex()}'\";"))

    # MD5 of UTF-16LE bytes
    md5_utf16le = hashlib.md5(pw_bytes_utf16le).digest()
    candidates.append(("md5-utf16le-raw", f"PRAGMA key = \"x'{md5_utf16le.hex()}'\";"))

    # 원본 비밀번호 앞 32바이트 그대로
    candidates.append(("utf8-first32-raw", f"PRAGMA key = \"x'{pw_bytes_utf8[:32].hex()}'\";"))

    # 원본 비밀번호 뒤 32바이트
    candidates.append(("utf8-last32-raw", f"PRAGMA key = \"x'{pw_bytes_utf8[-32:].hex()}'\";"))

    # UTF-16LE 앞 32바이트
    candidates.append(("utf16le-first32-raw", f"PRAGMA key = \"x'{pw_bytes_utf16le[:32].hex()}'\";"))
    candidates.append(("utf16le-last32-raw", f"PRAGMA key = \"x'{pw_bytes_utf16le[-32:].hex()}'\";"))

    # UTF-16BE 앞 32바이트
    candidates.append(("utf16be-first32-raw", f"PRAGMA key = \"x'{pw_bytes_utf16be[:32].hex()}'\";"))
    candidates.append(("utf16be-last32-raw", f"PRAGMA key = \"x'{pw_bytes_utf16be[-32:].hex()}'\";"))

    # SHA1 of UTF-16LE (20바이트) → 32바이트로 패딩
    sha1_utf16le = hashlib.sha1(pw_bytes_utf16le).digest()
    padded = sha1_utf16le + b'\x00' * 12
    candidates.append(("sha1-utf16le-padded-raw", f"PRAGMA key = \"x'{padded.hex()}'\";"))

    return candidates


# ============================================================
# 2. PRAGMA 설정 조합 (핵심만)
# ============================================================
def generate_pragma_combos():
    """각 (라벨, PRAGMA 설정 문 리스트)"""
    combos = []

    # compat 모드
    for compat in [1, 2, 3, 4]:
        combos.append((
            f"compat={compat}",
            [f"PRAGMA cipher_compatibility = {compat};"]
        ))

    # 수동 조합 (HMAC OFF 우선, 그다음 ON)
    for page_size in [1024, 4096, 2048, 512]:
        for kdf_iter in [4000, 64000, 256000, 1, 2, 1000]:
            for use_hmac in ["OFF", "ON"]:
                for cipher_mode in ["CBC", "CTR"]:
                    combos.append((
                        f"page={page_size}, kdf_iter={kdf_iter}, hmac={use_hmac}, mode={cipher_mode}",
                        [
                            f"PRAGMA cipher_page_size = {page_size};",
                            f"PRAGMA kdf_iter = {kdf_iter};",
                            f"PRAGMA cipher_use_hmac = {use_hmac};",
                            f"PRAGMA cipher_mode = {cipher_mode};",
                        ]
                    ))

    return combos


# ============================================================
# 3. 메인 실행
# ============================================================
def main():
    if not os.path.exists(SQLCIPHER):
        log(f"sqlcipher.exe 없음: {SQLCIPHER}")
        return 1
    if not os.path.exists(DB_FILE):
        log(f"DB 파일 없음: {DB_FILE}")
        return 1

    key_candidates = generate_key_candidates()
    pragma_combos = generate_pragma_combos()

    total = len(key_candidates) * len(pragma_combos)
    log(f"=== 키 후보 {len(key_candidates)}개 × PRAGMA {len(pragma_combos)}개 = {total}회 시도 시작 ===")

    start_time = time.time()
    success = False
    count = 0

    for key_label, key_stmt in key_candidates:
        for pragma_label, pragma_stmts in pragma_combos:
            count += 1
            statements = [key_stmt] + pragma_stmts
            ok, rows, raw = try_sql(statements)

            if ok:
                log(f"✅ 성공! [{count}/{total}] key={key_label} | pragma={pragma_label} → rows={rows}")
                log(f"   명령: {statements}")

                # 평문 DB 추출
                extract_stmts = list(statements) + [
                    "ATTACH DATABASE 'plaintext_dic.db' AS plaintext KEY '';",
                    "SELECT sqlcipher_export('plaintext');",
                    "DETACH DATABASE plaintext;",
                    ".quit",
                ]
                try:
                    r = subprocess.run(
                        [SQLCIPHER, DB_FILE],
                        input="\n".join(extract_stmts) + "\n",
                        capture_output=True, text=True, timeout=180,
                        encoding="utf-8", errors="replace"
                    )
                    if os.path.exists("plaintext_dic.db") and os.path.getsize("plaintext_dic.db") > 0:
                        log(f"🎉 평문 DB 추출 성공: plaintext_dic.db ({os.path.getsize('plaintext_dic.db')} bytes)")
                        success = True
                        break
                    else:
                        log(f"평문 DB 추출 실패. 출력: {(r.stdout or '')[-500:]}")
                except Exception as e:
                    log(f"추출 중 예외: {e}")

        if success:
            break

        # 진행률 (200회마다)
        if count % 200 == 0:
            elapsed = time.time() - start_time
            log(f"진행: {count}/{total} (경과 {elapsed:.0f}초)")

    elapsed = time.time() - start_time
    if success:
        log(f"=== 완료. 성공 (경과 {elapsed:.0f}초) ===")
        return 0
    else:
        log(f"=== 모든 {count}회 시도 실패 (경과 {elapsed:.0f}초) ===")
        return 1


if __name__ == "__main__":
    sys.exit(main())