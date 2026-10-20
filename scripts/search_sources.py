import os

target_dir = 'synonymAPK'
keywords = ['sqlcipher', 'loadlibrary', 'skt', 'armmanager', 'sqlite']

for root, dirs, files in os.walk(target_dir):
    for file in files:
        if file.endswith(('.java', '.smali', '.xml')):
            file_path = os.path.join(root, file)
            try:
                with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                    content = f.read()
                    for kw in keywords:
                        if kw in content.lower():
                            print(f"[Match: {kw}] found in -> {file_path}")
            except Exception as e:
                pass