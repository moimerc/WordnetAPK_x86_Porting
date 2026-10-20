import subprocess
import os
import itertools
import sys
import time
from datetime import datetime

# ============================================================
# 설정
# ============================================================
WORK_DIR = r"C:\Users\moimerc\ATELIER\Wordnet_project"
SQLCIPHER = os.path.join(WORK_DIR, "sqlcipher.exe")
DB_FILE = ".dicPyojaeEnc20140812.db"
PASSWORD = "s3KkssFmsdksemfhdl@emr7oqkfwkd!lek!gozldgksmst9oRlsm5sskrke0lwufk1"
LOG_FILE = os.path.join(WORK_DIR, "brute_log.txt")

os.chdir(WORK_DIR)

def log(msg):
    line = f"[{datetime.now().strftime('%H:%M:%S')}] {msg}"
    print(line, flush=True)
    try:
        with open(LOG_FILE, "a", encoding="utf-8") as f:
            f.write(line + "\n")
    except OSError:
        pass

def try_sql(sql_statements):
    """
    sql_statements: PRAGMA 문 리스트
    반환: (성공여부, 결과숫자 또는 None, 원본출력)
    """
    sql_text = "\n".join(sql_statements) + "\nSELECT count(*) FROM sqlite_master;\n.quit\n"
    try:
        result = subprocess.run(
            [SQLCIPHER, DB_FILE],
            input=sql_text,
            capture_output=True,
            text=True,
            timeout=15,
            encoding="utf-8",
            errors="replace"
        )
    except subprocess.TimeoutExpired:
        return (False, None, "TIMEOUT")
    except Exception as e:
        return (False, None, str(e))

    output = (result.stdout or "") + (result.stderr or "")

    # 실패 판정
    if "file is not a database" in output:
        return (False, None, output)
    if "Error:" in output and "count" not in output.lower():
        return (False, None, output)

    # 성공 판정: sqlite> 다음에 숫자만 있는 줄이 나오면 성공
    lines = output.split("\n")
    for i, line in enumerate(lines):
        stripped = line.strip()
        if stripped.isdigit():
            return (True, int(stripped), output)

    return (False, None, output)

def build_combos():
    """모든 조합을 순서대로 생성. 우선순위 순."""
    combos = []

    # === 1순위: cipher_compatibility 단독 (빠름) ===
    for compat in [1, 2, 3, 4]:
        combos.append((
            f"compat={compat}",
            [
                f"PRAGMA cipher_compatibility = {compat};",
                f"PRAGMA key = '{PASSWORD}';",
            ]
        ))

    # === 2순위: compat + page_size 변형 ===
    for compat in [1, 2, 3]:
        for page_size in [512, 1024, 2048, 4096, 8192]:
            combos.append((
                f"compat={compat}, page={page_size}",
                [
                    f"PRAGMA cipher_compatibility = {compat};",
                    f"PRAGMA key = '{PASSWORD}';",
                    f"PRAGMA cipher_page_size = {page_size};",
                ]
            ))

    # === 3순위: 수동 PRAGMA 조합 (HMAC OFF 포함) ===
    page_sizes = [512, 1024, 2048, 4096, 8192, 16384]
    kdf_iters = [1, 2, 4, 100, 256, 1000, 4000, 64000, 256000]
    hmac_modes = ["ON", "OFF"]
    hmac_algs = ["HMAC_SHA1", "HMAC_SHA256", "HMAC_SHA512"]
    kdf_algs = ["PBKDF2_HMAC_SHA1", "PBKDF2_HMAC_SHA256", "PBKDF2_HMAC_SHA512"]

    # 3a: HMAC OFF 우선 (SQLCipher 1.x 대응)
    for page_size in page_sizes:
        for kdf_iter in kdf_iters:
            for hmac_alg in hmac_algs:
                for kdf_alg in kdf_algs:
                    combos.append((
                        f"page={page_size}, kdf_iter={kdf_iter}, hmac=OFF, hmac_alg={hmac_alg}, kdf_alg={kdf_alg}",
                        [
                            f"PRAGMA key = '{PASSWORD}';",
                            f"PRAGMA cipher_page_size = {page_size};",
                            f"PRAGMA kdf_iter = {kdf_iter};",
                            "PRAGMA cipher_use_hmac = OFF;",
                            f"PRAGMA cipher_hmac_algorithm = {hmac_alg};",
                            f"PRAGMA cipher_kdf_algorithm = {kdf_alg};",
                        ]
                    ))

    # 3b: HMAC ON 조합
    for page_size in page_sizes:
        for kdf_iter in kdf_iters:
            for hmac_alg in hmac_algs:
                for kdf_alg in kdf_algs:
                    combos.append((
                        f"page={page_size}, kdf_iter={kdf_iter}, hmac=ON, hmac_alg={hmac_alg}, kdf_alg={kdf_alg}",
                        [
                            f"PRAGMA key = '{PASSWORD}';",
                            f"PRAGMA cipher_page_size = {page_size};",
                            f"PRAGMA kdf_iter = {kdf_iter};",
                            "PRAGMA cipher_use_hmac = ON;",
                            f"PRAGMA cipher_hmac_algorithm = {hmac_alg};",
                            f"PRAGMA cipher_kdf_algorithm = {kdf_alg};",
                        ]
                    ))

    return combos


def main():
    if not os.path.exists(SQLCIPHER):
        log(f"sqlcipher.exe를 찾을 수 없음: {SQLCIPHER}")
        return 1
    if not os.path.exists(DB_FILE):
        log(f"DB 파일을 찾을 수 없음: {DB_FILE}")
        return 1

    combos = build_combos()
    log(f"총 {len(combos)}개 조합 테스트 시작")

    success_list = []
    start_time = time.time()

    for idx, (label, sql_list) in enumerate(combos, 1):
        ok, count, raw = try_sql(sql_list)
        if ok:
            log(f"✅ 성공! [{idx}/{len(combos)}] {label} → sqlite_master rows = {count}")
            success_list.append((label, sql_list, count))
            # 첫 성공에서 바로 평문 DB 추출 시도
            extract_sql = list(sql_list) + [
                "ATTACH DATABASE 'plaintext_dic.db' AS plaintext KEY '';",
                "SELECT sqlcipher_export('plaintext');",
                "DETACH DATABASE plaintext;",
                ".quit",
            ]
            try:
                result = subprocess.run(
                    [SQLCIPHER, DB_FILE],
                    input="\n".join(extract_sql) + "\n",
                    capture_output=True, text=True, timeout=120,
                    encoding="utf-8", errors="replace"
                )
                out = (result.stdout or "") + (result.stderr or "")
                if os.path.exists("plaintext_dic.db") and os.path.getsize("plaintext_dic.db") > 0:
                    log(f"🎉 평문 DB 추출 성공: plaintext_dic.db ({os.path.getsize('plaintext_dic.db')} bytes)")
                else:
                    log(f"평문 DB 추출 실패. 출력: {out[-500:]}")
            except Exception as e:
                log(f"평문 DB 추출 중 예외: {e}")
            break
        else:
            # 진행률 (100개마다)
            if idx % 100 == 0:
                elapsed = time.time() - start_time
                log(f"진행: {idx}/{len(combos)} (경과 {elapsed:.0f}초)")

    total_elapsed = time.time() - start_time
    log(f"테스트 완료. 총 {len(combos)}개 중 {len(success_list)}개 성공 (경과 {total_elapsed:.0f}초)")
    if not success_list:
        log("모든 조합 실패. 비밀번호가 다르거나 커스텀 암호화일 가능성.")
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())