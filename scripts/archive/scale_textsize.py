import os
import re

# ============================================================
# 설정
# ============================================================
LAYOUT_DIR = r"synonym_x86_mod\res\layout"
TARGET_FILES = ["act_dic_search.xml", "suggestlist.xml"]

# 배율: 2.0 = 2배, 1.8 = 1.8배
TEXT_SCALE = 2.0
PADDING_SCALE = 2.0

# textSize 속성 매칭 (예: android:textSize="15.0dp")
TEXT_SIZE_PAT = re.compile(r'(android:textSize=")([\d.]+)(dp")')
# paddingBottom/Left/Right/Top 매칭
PADDING_PAT = re.compile(r'(android:padding(?:Bottom|Top|Left|Right)=")([\d.]+)(dp")')


def scale_file(path):
    with open(path, "r", encoding="utf-8") as f:
        content = f.read()

    orig = content

    # 1) textSize 2배
    def repl_text(m):
        val = float(m.group(2))
        new_val = round(val * TEXT_SCALE, 1)
        return f'{m.group(1)}{new_val}{m.group(3)}'

    content = TEXT_SIZE_PAT.sub(repl_text, content)

    # 2) padding 2배
    def repl_pad(m):
        val = float(m.group(2))
        new_val = round(val * PADDING_SCALE, 1)
        return f'{m.group(1)}{new_val}{m.group(3)}'

    content = PADDING_PAT.sub(repl_pad, content)

    # 3) paddingBottom이 아예 없는 TextView에는 추가 (잘림 방지)
    #    <TextView ... />  self-closing 태그에 paddingBottom 없으면 추가
    def add_padding_bottom(m):
        tag = m.group(0)
        # 이미 paddingBottom 있으면 스킵
        if "android:paddingBottom" in tag:
            return tag
        # TextView가 아니면 스킵
        if "<TextView" not in tag:
            return tag
        # self-closing 끝 `/>` 바로 앞에 paddingBottom 삽입
        return tag.replace("/>", 'android:paddingBottom="6.0dp" />')

    # TextView self-closing 태그 매칭 (여러 줄 가능)
    textview_pat = re.compile(r'<TextView[^>]*?/>', re.DOTALL)
    content = textview_pat.sub(add_padding_bottom, content)

    if content != orig:
        # 백업
        backup = path + ".bak"
        if not os.path.exists(backup):
            with open(backup, "w", encoding="utf-8") as f:
                f.write(orig)
        with open(path, "w", encoding="utf-8") as f:
            f.write(content)
        print(f"✅ 수정 완료: {path}  (백업: {backup})")
    else:
        print(f"⚠️  변경 없음: {path}")


def main():
    for fname in TARGET_FILES:
        path = os.path.join(LAYOUT_DIR, fname)
        if not os.path.exists(path):
            print(f"❌ 파일 없음: {path}")
            continue
        scale_file(path)


if __name__ == "__main__":
    main()