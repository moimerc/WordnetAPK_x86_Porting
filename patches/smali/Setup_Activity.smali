.class public Lcom/wordnet/dic/synonym/Setup_Activity;
.super Landroid/app/Activity;
.source "Setup_Activity.java"


# instance fields
.field private arrFirstWordGrade:[Ljava/lang/String;

.field private arrFontSize:[Ljava/lang/String;

.field private arrSecondWordGrade:[Ljava/lang/String;

.field private btnSetupDisplayFontSize:Landroid/widget/Button;

.field private btnSetupDownload:Landroid/widget/Button;

.field private btnSetupSearch01:Landroid/widget/Button;

.field private btnSetupSearch02:Landroid/widget/Button;

.field private intFirstWordGradeSelect:I

.field private intFontSizeSelect:I

.field private intSecondWordGradeSelect:I

.field mPrefClickListener:Landroid/view/View$OnClickListener;

.field setupView:Landroid/widget/ScrollView;

.field private txtViewSetupDisplayFontSize:Landroid/widget/TextView;

.field private txtViewSetupDisplayFontSizeTitle:Landroid/widget/TextView;

.field private txtViewSetupSearch01:Landroid/widget/TextView;

.field private txtViewSetupSearch02:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 149
    new-instance v0, Lcom/wordnet/dic/synonym/Setup_Activity$1;

    invoke-direct {v0, p0}, Lcom/wordnet/dic/synonym/Setup_Activity$1;-><init>(Lcom/wordnet/dic/synonym/Setup_Activity;)V

    iput-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->mPrefClickListener:Landroid/view/View$OnClickListener;

    .line 16
    return-void
.end method

.method static synthetic access$0(Lcom/wordnet/dic/synonym/Setup_Activity;)I
    .locals 1

    .prologue
    .line 28
    iget v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->intFontSizeSelect:I

    return v0
.end method

.method static synthetic access$1(Lcom/wordnet/dic/synonym/Setup_Activity;I)V
    .locals 0

    .prologue
    .line 28
    iput p1, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->intFontSizeSelect:I

    return-void
.end method

.method static synthetic access$10(Lcom/wordnet/dic/synonym/Setup_Activity;I)V
    .locals 0

    .prologue
    .line 30
    iput p1, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->intSecondWordGradeSelect:I

    return-void
.end method

.method static synthetic access$11(Lcom/wordnet/dic/synonym/Setup_Activity;)[Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->arrSecondWordGrade:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$12(Lcom/wordnet/dic/synonym/Setup_Activity;)Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->txtViewSetupSearch02:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$13(Lcom/wordnet/dic/synonym/Setup_Activity;)V
    .locals 0

    .prologue
    .line 244
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/Setup_Activity;->deleteDataFile()V

    return-void
.end method

.method static synthetic access$2(Lcom/wordnet/dic/synonym/Setup_Activity;)[Ljava/lang/String;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->arrFontSize:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3(Lcom/wordnet/dic/synonym/Setup_Activity;)Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->txtViewSetupDisplayFontSize:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$4(Lcom/wordnet/dic/synonym/Setup_Activity;)Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->txtViewSetupDisplayFontSizeTitle:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$5(Lcom/wordnet/dic/synonym/Setup_Activity;)I
    .locals 1

    .prologue
    .line 29
    iget v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->intFirstWordGradeSelect:I

    return v0
.end method

.method static synthetic access$6(Lcom/wordnet/dic/synonym/Setup_Activity;I)V
    .locals 0

    .prologue
    .line 29
    iput p1, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->intFirstWordGradeSelect:I

    return-void
.end method

.method static synthetic access$7(Lcom/wordnet/dic/synonym/Setup_Activity;)[Ljava/lang/String;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->arrFirstWordGrade:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$8(Lcom/wordnet/dic/synonym/Setup_Activity;)Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->txtViewSetupSearch01:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$9(Lcom/wordnet/dic/synonym/Setup_Activity;)I
    .locals 1

    .prologue
    .line 30
    iget v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->intSecondWordGradeSelect:I

    return v0
.end method

.method private deleteDataFile()V
    .locals 5

    .prologue
    .line 246
    :try_start_0
    new-instance v0, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 247
    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "wordnet"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 246
    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 248
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Setup_Activity;->getParent()Landroid/app/Activity;

    move-result-object v3

    const-string v4, "\ud574\ub2f9 \ud3f4\ub354\uac00 \uc874\uc7ac\ud558\uc9c0 \uc54a\uc2b5\ub2c8\ub2e4."

    invoke-static {v3, v4}, Lcom/wordnet/dic/synonym/common/CommonUtil;->showMessageBox(Landroid/content/Context;Ljava/lang/String;)V

    .line 250
    :cond_0
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".dicPyojaeEnc20140812.db"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 252
    .local v2, "target":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 253
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 254
    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Setup_Activity;->getParent()Landroid/app/Activity;

    move-result-object v3

    const-string v4, "\ub370\uc774\ud130 \ud30c\uc77c\uc774 \uc0ad\uc81c\ub418\uc5c8\uc2b5\ub2c8\ub2e4."

    invoke-static {v3, v4}, Lcom/wordnet/dic/synonym/common/CommonUtil;->showMessageBox(Landroid/content/Context;Ljava/lang/String;)V

    .line 256
    const/4 v3, 0x0

    sput-boolean v3, Lcom/wordnet/dic/synonym/common/CommonVariable;->chkDB:Z

    .line 257
    const/4 v3, 0x0

    sput-object v3, Lcom/wordnet/dic/synonym/common/CommonVariable;->mDBHelper:Lcom/wordnet/dic/synonym/data/DatabaseHelper;

    .line 265
    .end local v0    # "dir":Ljava/io/File;
    .end local v2    # "target":Ljava/io/File;
    :goto_0
    return-void

    .line 260
    .restart local v0    # "dir":Ljava/io/File;
    .restart local v2    # "target":Ljava/io/File;
    :cond_1
    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Setup_Activity;->getParent()Landroid/app/Activity;

    move-result-object v3

    const-string v4, "\ud574\ub2f9 \ud30c\uc77c\uc774 \uc874\uc7ac\ud558\uc9c0 \uc54a\uc2b5\ub2c8\ub2e4."

    invoke-static {v3, v4}, Lcom/wordnet/dic/synonym/common/CommonUtil;->showMessageBox(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 262
    .end local v0    # "dir":Ljava/io/File;
    .end local v2    # "target":Ljava/io/File;
    :catch_0
    move-exception v1

    .line 263
    .local v1, "ex":Ljava/lang/Exception;
    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Setup_Activity;->getParent()Landroid/app/Activity;

    move-result-object v3

    const-string v4, "\ub370\uc774\ud130 \ud30c\uc77c \uc0ad\uc81c\uc911 \uc624\ub958\uac00 \ubc1c\uc0dd\ud558\uc600\uc2b5\ub2c8\ub2e4."

    invoke-static {v3, v4}, Lcom/wordnet/dic/synonym/common/CommonUtil;->showMessageBox(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private getPrefValue()V
    .locals 5

    .prologue
    const/4 v4, 0x3

    const/4 v3, 0x0

    .line 92
    const-string v2, "pref"

    invoke-virtual {p0, v2, v3}, Lcom/wordnet/dic/synonym/Setup_Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 93
    .local v1, "pref":Landroid/content/SharedPreferences;
    sget-object v2, Lcom/wordnet/dic/synonym/common/CommonVariable;->mCommonUtil:Lcom/wordnet/dic/synonym/common/CommonUtil;

    invoke-virtual {v2, v1}, Lcom/wordnet/dic/synonym/common/CommonUtil;->getPreference(Landroid/content/SharedPreferences;)V

    .line 96
    iget-object v2, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->arrFontSize:[Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 97
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->arrFontSize:[Ljava/lang/String;

    array-length v2, v2

    if-lt v0, v2, :cond_0

    .line 108
    .end local v0    # "i":I
    :goto_1
    iget-object v2, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->arrFirstWordGrade:[Ljava/lang/String;

    if-eqz v2, :cond_5

    .line 110
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2
    iget-object v2, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->arrFirstWordGrade:[Ljava/lang/String;

    array-length v2, v2

    if-lt v0, v2, :cond_3

    .line 121
    .end local v0    # "i":I
    :goto_3
    iget-object v2, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->arrSecondWordGrade:[Ljava/lang/String;

    if-eqz v2, :cond_8

    .line 123
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_4
    iget-object v2, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->arrSecondWordGrade:[Ljava/lang/String;

    array-length v2, v2

    if-lt v0, v2, :cond_6

    .line 133
    .end local v0    # "i":I
    :goto_5
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/Setup_Activity;->setPrefDisplayValue()V

    .line 134
    return-void

    .line 98
    .restart local v0    # "i":I
    :cond_0
    iget-object v2, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->arrFontSize:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/wordnet/dic/synonym/common/CommonVariable;->pref_FontSize:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 99
    iput v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->intFontSizeSelect:I

    goto :goto_1

    .line 97
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 104
    .end local v0    # "i":I
    :cond_2
    iput v3, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->intFontSizeSelect:I

    goto :goto_1

    .line 111
    .restart local v0    # "i":I
    :cond_3
    iget-object v2, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->arrFirstWordGrade:[Ljava/lang/String;

    aget-object v2, v2, v0

    sget-object v3, Lcom/wordnet/dic/synonym/common/CommonVariable;->pref_FirstGrade:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 112
    iput v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->intFirstWordGradeSelect:I

    goto :goto_3

    .line 110
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 117
    .end local v0    # "i":I
    :cond_5
    iput v4, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->intFirstWordGradeSelect:I

    goto :goto_3

    .line 124
    .restart local v0    # "i":I
    :cond_6
    iget-object v2, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->arrSecondWordGrade:[Ljava/lang/String;

    aget-object v2, v2, v0

    sget-object v3, Lcom/wordnet/dic/synonym/common/CommonVariable;->pref_SecondGrade:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 125
    iput v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->intSecondWordGradeSelect:I

    goto :goto_5

    .line 123
    :cond_7
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 130
    .end local v0    # "i":I
    :cond_8
    iput v4, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->intSecondWordGradeSelect:I

    goto :goto_5
.end method

.method private setPrefDisplayValue()V
    .locals 3

    .prologue
    .line 139
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->txtViewSetupDisplayFontSize:Landroid/widget/TextView;

    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->pref_FontSize:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 140
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->txtViewSetupDisplayFontSizeTitle:Landroid/widget/TextView;

    const/4 v1, 0x1

    sget-object v2, Lcom/wordnet/dic/synonym/common/CommonVariable;->pref_FontSize:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 143
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->txtViewSetupSearch01:Landroid/widget/TextView;

    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->pref_FirstGrade:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->txtViewSetupSearch02:Landroid/widget/TextView;

    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->pref_SecondGrade:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 147
    return-void
.end method


# virtual methods
.method public initialize()V
    .locals 3

    .prologue
    .line 66
    const v0, 0x7f070020

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/Setup_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    iput-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->setupView:Landroid/widget/ScrollView;

    .line 67
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->setupView:Landroid/widget/ScrollView;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Setup_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020038

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 69
    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Setup_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f050002

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->arrFontSize:[Ljava/lang/String;

    .line 70
    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Setup_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f050003

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->arrFirstWordGrade:[Ljava/lang/String;

    .line 71
    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Setup_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f050004

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->arrSecondWordGrade:[Ljava/lang/String;

    .line 73
    const v0, 0x7f070022

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/Setup_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->btnSetupDisplayFontSize:Landroid/widget/Button;

    .line 74
    const v0, 0x7f070025

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/Setup_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->btnSetupSearch01:Landroid/widget/Button;

    .line 75
    const v0, 0x7f070028

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/Setup_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->btnSetupSearch02:Landroid/widget/Button;

    .line 76
    const v0, 0x7f07002b

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/Setup_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->btnSetupDownload:Landroid/widget/Button;

    .line 78
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->btnSetupDisplayFontSize:Landroid/widget/Button;

    iget-object v1, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->mPrefClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->btnSetupSearch01:Landroid/widget/Button;

    iget-object v1, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->mPrefClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 80
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->btnSetupSearch02:Landroid/widget/Button;

    iget-object v1, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->mPrefClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 81
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->btnSetupDownload:Landroid/widget/Button;

    iget-object v1, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->mPrefClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 83
    const v0, 0x7f070023

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/Setup_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->txtViewSetupDisplayFontSize:Landroid/widget/TextView;

    .line 84
    const v0, 0x7f070026

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/Setup_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->txtViewSetupSearch01:Landroid/widget/TextView;

    .line 85
    const v0, 0x7f070029

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/Setup_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->txtViewSetupSearch02:Landroid/widget/TextView;

    .line 87
    const v0, 0x7f070021

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/Setup_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/wordnet/dic/synonym/Setup_Activity;->txtViewSetupDisplayFontSizeTitle:Landroid/widget/TextView;

    .line 88
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .prologue
    .line 268
    sget-object v0, Lcom/wordnet/dic/synonym/DicSynonym;->tabHost:Landroid/widget/TabHost;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->setCurrentTab(I)V

    .line 269
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 39
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 40
    const v0, 0x7f030005

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/Setup_Activity;->setContentView(I)V

    .line 42
    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Setup_Activity;->initialize()V

    .line 43
    return-void
.end method

.method public onPause()V
    .locals 6

    .prologue
    .line 46
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 48
    const-string v0, "pref"

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Lcom/wordnet/dic/synonym/Setup_Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 50
    .local v1, "pref":Landroid/content/SharedPreferences;
    sget-object v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->mCommonUtil:Lcom/wordnet/dic/synonym/common/CommonUtil;

    .line 51
    sget-object v2, Lcom/wordnet/dic/synonym/common/CommonVariable;->pref_HistoryCount:Ljava/lang/String;

    .line 52
    sget-object v3, Lcom/wordnet/dic/synonym/common/CommonVariable;->pref_FontSize:Ljava/lang/String;

    .line 53
    sget-object v4, Lcom/wordnet/dic/synonym/common/CommonVariable;->pref_FirstGrade:Ljava/lang/String;

    .line 54
    sget-object v5, Lcom/wordnet/dic/synonym/common/CommonVariable;->pref_SecondGrade:Ljava/lang/String;

    .line 50
    invoke-virtual/range {v0 .. v5}, Lcom/wordnet/dic/synonym/common/CommonUtil;->setPreference(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 58
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 60
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/Setup_Activity;->setRequestedOrientation(I)V

    .line 61
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/Setup_Activity;->getPrefValue()V

    .line 62
    return-void
.end method
