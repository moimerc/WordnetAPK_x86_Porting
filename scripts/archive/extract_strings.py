import re

def extract_strings(file_path, min_length=4):
    with open(file_path, 'rb') as f:
        content = f.read()
    # 영문, 숫자, 특수문자 조합의 텍스트 패턴 추출
    strings = re.findall(b'[\x20-\x7e]{' + str(min_length).encode() + b',}', content)
    return [s.decode('utf-8', errors='ignore') for s in strings]

# 대상 파일: libARMPlugin.so 로 변경
so_file = 'synonym_x86/lib/armeabi/libdatabase_sqlcipher.so'

found_strings = extract_strings(so_file)
print(f"=== Extracted strings from {so_file} ===")
for s in found_strings:
    # 플러그인 내부의 함수 심볼, 에러 메시지, JNI 관련 키워드 출력
    if any(k in s.lower() for k in ['java', 'native', 'plugin', 'dic', 'synonym', 'init', 'open', 'read', 'error', '_zn']):
        print(s)
    elif len(found_strings) < 100:  # 총 문자열이 적다면 필터링 없이 전체 출력 유도용
        print(s)