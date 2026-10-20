import os
import re
import shutil

LAYOUT_DIR = r"synonym_x86_mod\res\layout"


def backup(path):
    bak = path + ".orig2"
    if not os.path.exists(bak):
        shutil.copy2(path, bak)
        print(f"  백업: {bak}")


def patch_suggestlist(path):
    print(f"\n=== {path} ===")
    backup(path)
    with open(path, "r", encoding="utf-8") as f:
        c = f.read()
    orig = c

    # 1) 최상위 paddingTop/Bottom 1.0 → 2.0
    c = c.replace(
        'android:paddingTop="1.0dp" android:paddingBottom="1.0dp"',
        'android:paddingTop="2.0dp" android:paddingBottom="2.0dp"'
    )

    # 2) 제목 컨테이너: height 23dp 고정 → wrap_content + minHeight 52dp
    c = c.replace(
        'android:padding="3.0dp" android:layout_width="match_parent" android:layout_height="23.0dp"',
        'android:padding="3.0dp" android:layout_width="match_parent" android:layout_height="wrap_content" android:minHeight="52.0dp"'
    )

    # 3) 뜻 컨테이너에 minHeight 34dp 추가
    c = c.replace(
        '<RelativeLayout android:padding="3.0dp" android:layout_width="match_parent" android:layout_height="wrap_content">\n            <TextView android:textSize="11.0dp"',
        '<RelativeLayout android:padding="3.0dp" android:layout_width="match_parent" android:layout_height="wrap_content" android:minHeight="34.0dp">\n            <TextView android:textSize="22.0dp"'
    )

    # 4) 개별 textSize 확대 (id별로 정확히 매칭)
    # pyojaeName: 15 → 30
    c = re.sub(
        r'(android:textSize=")15\.0(dp" android:textStyle="bold" android:textColor="@color/searchList_PyojaeName" android:id="@id/pyojaeName")',
        r'\g<1>30.0\g<2>', c
    )
    # pyojaeNameEtc: 13 → 26
    c = re.sub(
        r'(android:textSize=")13\.0(dp" android:textColor="@color/searchList_PyojaeNameEtc" android:id="@id/pyojaeNameEtc")',
        r'\g<1>26.0\g<2>', c
    )
    # wordGrade: 8 → 16
    c = re.sub(
        r'(android:textSize=")8\.0(dp" android:textColor="@color/searchList_WordGrade" android:id="@id/wordGrade")',
        r'\g<1>16.0\g<2>', c
    )
    # mean: 11 → 22 (이미 위에서 처리됨, 안전하게 한 번 더)
    c = re.sub(
        r'(android:textSize=")11\.0(dp" android:textColor="@color/searchList_Mean" android:id="@id/mean")',
        r'\g<1>22.0\g<2>', c
    )

    if c != orig:
        with open(path, "w", encoding="utf-8") as f:
            f.write(c)
        print("  ✅ 수정 완료")
    else:
        print("  ⚠️  변경 사항 없음 (패턴 매칭 실패?)")


def patch_act_dic_search(path):
    print(f"\n=== {path} ===")
    backup(path)
    with open(path, "r", encoding="utf-8") as f:
        c = f.read()
    orig = c

    # 1) 상세 타이틀 컨테이너: height 35dp 고정 → wrap_content + minHeight 70dp
    c = c.replace(
        'android:padding="3.0dp" android:layout_width="match_parent" android:layout_height="35.0dp" android:layout_marginTop="5.0dp"',
        'android:padding="3.0dp" android:layout_width="match_parent" android:layout_height="wrap_content" android:layout_marginTop="8.0dp" android:minHeight="70.0dp"'
    )

    # 2) 검색창 버튼 height 20dp → 30dp
    c = c.replace(
        'android:id="@id/btnBackward" android:layout_width="wrap_content" android:layout_height="20.0dp"',
        'android:id="@id/btnBackward" android:layout_width="wrap_content" android:layout_height="30.0dp"'
    )
    c = c.replace(
        'android:id="@id/btnForward" android:layout_width="wrap_content" android:layout_height="20.0dp"',
        'android:id="@id/btnForward" android:layout_width="wrap_content" android:layout_height="30.0dp"'
    )

    # 3) EditText에 textSize 22dp 추가 (이미 있으면 스킵)
    if 'android:id="@id/autoCompleteBox"' in c and 'android:textSize="22.0dp"' not in c:
        c = c.replace(
            'android:id="@id/autoCompleteBox" android:background="@drawable/searchbar_01" android:paddingLeft="12.0dp" android:layout_width="wrap_content" android:layout_height="wrap_content"',
            'android:id="@id/autoCompleteBox" android:background="@drawable/searchbar_01" android:paddingLeft="12.0dp" android:textSize="22.0dp" android:layout_width="wrap_content" android:layout_height="wrap_content"'
        )

    # 4) detail_WordGrade: 15 → 24
    c = re.sub(
        r'(android:textSize=")15\.0(dp" android:textColor="@color/searchList_WordGrade" android:id="@id/detail_WordGrade")',
        r'\g<1>24.0\g<2>', c
    )
    # detail_PyojaeName: 21 → 36
    c = re.sub(
        r'(android:textSize=")21\.0(dp" android:textStyle="bold" android:textColor="@color/searchList_PyojaeName" android:id="@id/detail_PyojaeName")',
        r'\g<1>36.0\g<2>', c
    )
    # detail_PyojaeNameEtc: 21 → 36
    c = re.sub(
        r'(android:textSize=")21\.0(dp" android:textColor="@color/searchList_PyojaeNameEtc" android:id="@id/detail_PyojaeNameEtc")',
        r'\g<1>36.0\g<2>', c
    )
    # detail_WordClass: 15 → 24 (paddingTop 7 → 12)
    c = c.replace(
        'android:textSize="15.0dp" android:textColor="@color/searchList_WordClass" android:id="@id/detail_WordClass" android:paddingTop="7.0dp"',
        'android:textSize="24.0dp" android:textColor="@color/searchList_WordClass" android:id="@id/detail_WordClass" android:paddingTop="12.0dp"'
    )
    # detail_Mean: 13 → 22 (컨테이너에 minHeight 34dp 추가)
    c = c.replace(
        '<RelativeLayout android:layout_width="match_parent" android:layout_height="wrap_content" android:layout_marginLeft="10.0dp">\n                <TextView android:textSize="13.0dp" android:textColor="@color/searchList_Mean" android:id="@id/detail_Mean"',
        '<RelativeLayout android:layout_width="match_parent" android:layout_height="wrap_content" android:layout_marginLeft="10.0dp" android:minHeight="34.0dp">\n                <TextView android:textSize="22.0dp" android:textColor="@color/searchList_Mean" android:id="@id/detail_Mean"'
    )

    # 5) 하단 범례 텍스트: 8 → 14, 10 → 16
    #    ***  기호 (textColor=searchList_WordGrade)
    c = c.replace(
        'android:textSize="8.0dp" android:textColor="@color/searchList_WordGrade" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="***"',
        'android:textSize="14.0dp" android:textColor="@color/searchList_WordGrade" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="***"'
    )
    #    " 1등급, " / " 2등급, " / " 3등급" (textColor=searchList_PyojaeName)
    c = c.replace(
        'android:textSize="10.0dp" android:textColor="@color/searchList_PyojaeName"',
        'android:textSize="16.0dp" android:textColor="@color/searchList_PyojaeName"'
    )
    #    나머지 ** 기호 (textColor=searchList_WordGrade, text="**", "*")
    c = c.replace(
        'android:textSize="8.0dp" android:textColor="@color/searchList_WordGrade" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="**"',
        'android:textSize="14.0dp" android:textColor="@color/searchList_WordGrade" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="**"'
    )
    c = c.replace(
        'android:textSize="8.0dp" android:textColor="@color/searchList_WordGrade" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="*"',
        'android:textSize="14.0dp" android:textColor="@color/searchList_WordGrade" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="*"'
    )

    if c != orig:
        with open(path, "w", encoding="utf-8") as f:
            f.write(c)
        print("  ✅ 수정 완료")
    else:
        print("  ⚠️  변경 사항 없음 (패턴 매칭 실패?)")


def main():
    base = r"C:\Users\moimerc\ATELIER"  # 사용자님 경로에 맞게 조정
    os.chdir(base)

    patch_suggestlist(os.path.join(LAYOUT_DIR, "suggestlist.xml"))
    patch_act_dic_search(os.path.join(LAYOUT_DIR, "act_dic_search.xml"))
    print("\n완료. 재빌드 후 재설치하세요.")


if __name__ == "__main__":
    main()