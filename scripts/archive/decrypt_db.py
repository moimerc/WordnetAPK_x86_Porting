from pysqlcipher3 import dbapi2 as sqlite

def decrypt_database():
    db_file = '.dicPyojaeEnc20140812.db'
    plaintext_file = 'plaintext_dic.db'
    password = 's3KkssFmsdksemfhdl@emr7oqkfwkd!lek!gozldgksmst9oRlsm5sskrke0lwufk1'

    # 1. 암호화된 DB 연결
    conn = sqlite.connect(db_file)
    c = conn.cursor()

    # 2. SQLCipher 2.x 호환 PRAGMA 강제 주입 (가장 중요)
    c.execute(f"PRAGMA key = '{password}';")
    c.execute("PRAGMA cipher_page_size = 1024;")
    c.execute("PRAGMA kdf_iter = 4000;")
    c.execute("PRAGMA cipher_use_hmac = OFF;") # HMAC 검증 비활성화

    try:
        # 3. 마스터 테이블을 조회하여 복호화 성공 여부 테스트
        c.execute("SELECT count(*) FROM sqlite_master;")
        print("복호화 성공. 평문 DB 추출을 시작합니다...")

        # 4. 평문 DB로 내보내기 (Export)
        c.execute(f"ATTACH DATABASE '{plaintext_file}' AS plaintext KEY '';")
        c.execute("SELECT sqlcipher_export('plaintext');")
        c.execute("DETACH DATABASE plaintext;")
        
        print(f"작업 완료: {plaintext_file} 파일이 생성되었습니다.")

    except sqlite.DatabaseError as e:
        print("복호화 실패. 암호화 방식이나 비밀번호가 맞지 않습니다.")
        print(f"에러 메시지: {e}")
    finally:
        conn.close()

if __name__ == '__main__':
    decrypt_database()