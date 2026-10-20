import re

def extract_symbols(so_path):
    with open(so_path, 'rb') as f:
        data = f.read()
    # C++ mangled names 패턴
    syms = re.findall(b'_Z[0-9A-Za-z_]{5,}', data)
    return set(s.decode('utf-8', errors='ignore') for s in syms)

# 원본 앱의 ARM .so
arm_so = r"C:\Users\moimerc\ATELIER\synonym_x86\lib\armeabi\libdatabase_sqlcipher.so"
# 새로 받은 x86 .so
x86_so = r"C:\Users\moimerc\ATELIER\Wordnet_project\x86_libs\x86\libdatabase_sqlcipher.so"

arm_syms = extract_symbols(arm_so)
x86_syms = extract_symbols(x86_so)

print(f"ARM 심볼 수: {len(arm_syms)}")
print(f"x86 심볼 수: {len(x86_syms)}")

common = arm_syms & x86_syms
only_arm = arm_syms - x86_syms
only_x86 = x86_syms - arm_syms

print(f"공통: {len(common)}")
print(f"ARM에만: {len(only_arm)}")
print(f"x86에만: {len(only_x86)}")

print("\n[ARM에만 있는 sqlcipher 심볼 (앱 Java가 기대하는 것)]")
for s in sorted(only_arm):
    if 'sqlcipher' in s.lower() or 'sqlite' in s.lower():
        print(f"  {s}")

print("\n[x86에만 있는 sqlcipher 심볼]")
for s in sorted(only_x86):
    if 'sqlcipher' in s.lower() or 'sqlite' in s.lower():
        print(f"  {s}")