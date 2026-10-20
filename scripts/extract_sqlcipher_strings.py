import re
import os

def extract_strings(file_path, min_length=4):
    """바이너리 파일에서 ASCII 문자열을 추출."""
    with open(file_path, 'rb') as f:
        content = f.read()
    # 출력 가능한 ASCII 문자 4자 이상 연속 추출
    pattern = b'[\x20-\x7e]{' + str(min_length).encode() + b',}'
    strings = re.findall(pattern, content)
    return [s.decode('utf-8', errors='ignore') for s in strings]


def main():
    # ============================================================
    # 대상 파일
    # ============================================================
    so_file = r'synonym_x86/lib/armeabi/libdatabase_sqlcipher.so'

    if not os.path.exists(so_file):
        print(f"[오류] 파일을 찾을 수 없음: {so_file}")
        print("현재 작업 폴더:", os.getcwd())
        return

    print(f"=== Extracted strings from {so_file} ===")
    print(f"=== 파일 크기: {os.path.getsize(so_file)} bytes ===\n")

    found_strings = extract_strings(so_file, min_length=4)
    print(f"=== 총 추출 문자열 수: {len(found_strings)} ===\n")

    # ============================================================
    # 필터 키워드 (SQLCipher 버전/커스텀 여부 판별용)
    # ============================================================
    keywords = [
        # SQLCipher 버전 및 빌드 정보
        'cipher_version', 'sqlcipher', 'cipher_',
        'version', 'build', 'compiled',
        '3.', '2.', '1.',  # 버전 숫자 패턴

        # SQLite 관련
        'sqlite3_', 'SQLite', 'sqlite',

        # 암호화 알고리즘
        'aes', 'cbc', 'hmac', 'sha1', 'sha256', 'sha512',
        'md5', 'pbkdf2', 'kdf', 'iter',

        # 키 관련 함수
        'sqlite3_key', 'sqlite3_rekey',
        'native_key', 'dbopen', 'rekey',

        # page size / 설정 관련
        'page_size', 'cipher_page', 'cipher_use', 'cipher_default',

        # PRAGMA 관련
        'PRAGMA', 'pragma',

        # net.zetetic (공식 SQLCipher 패키지명)
        'zetetic', 'net.zetetic',

        # net.sqlcipher (앱 내부 패키지)
        'net.sqlcipher', 'sqlcipher/database',

        # JNI 시그니처
        '_ZN9sqlcipher', '_ZN7sqlcipher', '_ZN6sqlite',
        'JNI_OnLoad', 'Java_net_sqlcipher',

        # 에러 메시지
        'file is not a database', 'not a database',
        'unsupported', 'invalid',
    ]

    # ============================================================
    # 필터링 출력
    # ============================================================
    print("=== 키워드 매칭 결과 ===\n")
    matched_count = 0
    seen = set()

    for s in found_strings:
        lower = s.lower()
        for kw in keywords:
            if kw.lower() in lower:
                # 중복 제거
                if s in seen:
                    break
                seen.add(s)
                print(s)
                matched_count += 1
                break

    print(f"\n=== 매칭된 문자열 수: {matched_count} ===")

    # ============================================================
    # PRAGMA 관련 문자열 별도 출력 (기본값 확인용)
    # ============================================================
    print("\n=== PRAGMA / cipher 설정 관련 (전체) ===\n")
    pragma_count = 0
    for s in found_strings:
        lower = s.lower()
        if ('pragma' in lower or
            'cipher_' in lower or
            'kdf_iter' in lower or
            'page_size' in lower or
            'hmac' in lower):
            print(s)
            pragma_count += 1
    print(f"\n=== PRAGMA 관련 문자열 수: {pragma_count} ===")


if __name__ == "__main__":
    main()