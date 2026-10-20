.class public Lcom/wordnet/dic/synonym/Intro_Activity_Google;
.super Landroid/app/Activity;
.source "Intro_Activity_Google.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wordnet/dic/synonym/Intro_Activity_Google$MyLicenseCheckerCallback;
    }
.end annotation


# static fields
.field private static final BASE64_PUBLIC_KEY:Ljava/lang/String; = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAhSD8C0tzFQaIqLqhk2S07MOsnGd2x3eGjTMt8W19WSTFjo5zYU5VDIZVyIgwjR1OvoeAdedyIsDAgbnIAHZs386BmIPIHPNWwyPMq28b6N66Ppz8pHkaR3G8d/nwtj2EPWZldlJEat8SO9hNztBk7FKlr0FnXj/L4SAN80os1O8gk2anrSMWuC407sjVOW9moGzgW0kEUC/TF3Te5yqNL6gS1n1bLSF3y5WA3dORBLm+zdyezCj2/VnLcoOVhNG6nhamH1n8h98jSCfZYlsK6AY3DTO1siNGxQK+NAIVsFkD3WdwUobQiM8Pv2POMYhRrKrGpZQd0es5A8pbLd2DHQIDAQAB"

.field private static final SALT:[B


# instance fields
.field private mChecker:Lcom/android/vending/licensing/LicenseChecker;

.field private mLicenseCheckerCallback:Lcom/android/vending/licensing/LicenseCheckerCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const/16 v0, 0x14

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/wordnet/dic/synonym/Intro_Activity_Google;->SALT:[B

    return-void

    :array_0
    .array-data 1
        -0x2et
        0x41t
        0x1et
        -0x80t
        -0x67t
        -0x39t
        0x4at
        -0x40t
        0x33t
        0x58t
        -0x5ft
        -0x2dt
        0x4dt
        -0x75t
        -0x24t
        -0x71t
        -0xbt
        0x20t
        -0x40t
        0x59t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/wordnet/dic/synonym/Intro_Activity_Google;)V
    .locals 0

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/Intro_Activity_Google;->licenseCheckFail()V

    return-void
.end method

.method static synthetic access$1(Lcom/wordnet/dic/synonym/Intro_Activity_Google;)V
    .locals 0

    .prologue
    .line 104
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/Intro_Activity_Google;->initialize()V

    return-void
.end method

.method private initialize()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 106
    invoke-virtual {p0, v3}, Lcom/wordnet/dic/synonym/Intro_Activity_Google;->setRequestedOrientation(I)V

    .line 108
    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->mCommonUtil:Lcom/wordnet/dic/synonym/common/CommonUtil;

    if-nez v1, :cond_0

    .line 109
    invoke-static {p0}, Lcom/wordnet/dic/synonym/common/CommonUtil;->getInstance(Landroid/content/Context;)Lcom/wordnet/dic/synonym/common/CommonUtil;

    move-result-object v1

    sput-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->mCommonUtil:Lcom/wordnet/dic/synonym/common/CommonUtil;

    .line 116
    :cond_0
    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->bookmarkHelper:Lcom/wordnet/dic/synonym/data/BookmarkHelper;

    if-nez v1, :cond_1

    .line 117
    invoke-static {p0}, Lcom/wordnet/dic/synonym/data/BookmarkHelper;->getInstance(Landroid/content/Context;)Lcom/wordnet/dic/synonym/data/BookmarkHelper;

    move-result-object v1

    sput-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->bookmarkHelper:Lcom/wordnet/dic/synonym/data/BookmarkHelper;

    .line 120
    :cond_1
    const-string v1, "pref"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/wordnet/dic/synonym/Intro_Activity_Google;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 121
    .local v0, "pref":Landroid/content/SharedPreferences;
    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->mCommonUtil:Lcom/wordnet/dic/synonym/common/CommonUtil;

    invoke-virtual {v1, v0}, Lcom/wordnet/dic/synonym/common/CommonUtil;->getPreference(Landroid/content/SharedPreferences;)V

    .line 123
    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Intro_Activity_Google;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "\ud654\uba74\uc744 \ud130\uce58\ud558\uba74 \uac80\uc0c9\ud654\uba74\uc73c\ub85c \uc774\ub3d9\ud569\ub2c8\ub2e4."

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 124
    return-void
.end method

.method private licenseCheckFail()V
    .locals 4

    .prologue
    .line 80
    const-string v1, "\ubcf8 \uc5b4\ud50c\ub9ac\ucf00\uc774\uc158\uc744 \uc0ac\uc6a9\ud558\uae30 \uc704\ud55c \ub77c\uc774\uc13c\uc2a4 \uc778\uc99d\uc5d0 \uc2e4\ud328\ud558\uc600\uc2b5\ub2c8\ub2e4."

    const/4 v2, 0x1

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 82
    new-instance v0, Lcom/wordnet/dic/synonym/Intro_Activity_Google$1;

    invoke-direct {v0, p0}, Lcom/wordnet/dic/synonym/Intro_Activity_Google$1;-><init>(Lcom/wordnet/dic/synonym/Intro_Activity_Google;)V

    .line 88
    .local v0, "handler":Landroid/os/Handler;
    const/4 v1, 0x0

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 90
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 30
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 32
    new-instance v1, Lcom/wordnet/dic/synonym/Intro_Activity_Google$MyLicenseCheckerCallback;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/wordnet/dic/synonym/Intro_Activity_Google$MyLicenseCheckerCallback;-><init>(Lcom/wordnet/dic/synonym/Intro_Activity_Google;Lcom/wordnet/dic/synonym/Intro_Activity_Google$MyLicenseCheckerCallback;)V

    iput-object v1, p0, Lcom/wordnet/dic/synonym/Intro_Activity_Google;->mLicenseCheckerCallback:Lcom/android/vending/licensing/LicenseCheckerCallback;

    .line 33
    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Intro_Activity_Google;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "android_id"

    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 35
    .local v0, "deviceId":Ljava/lang/String;
    new-instance v1, Lcom/android/vending/licensing/LicenseChecker;

    new-instance v2, Lcom/android/vending/licensing/ServerManagedPolicy;

    new-instance v3, Lcom/android/vending/licensing/AESObfuscator;

    sget-object v4, Lcom/wordnet/dic/synonym/Intro_Activity_Google;->SALT:[B

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Intro_Activity_Google;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5, v0}, Lcom/android/vending/licensing/AESObfuscator;-><init>([BLjava/lang/String;Ljava/lang/String;)V

    invoke-direct {v2, p0, v3}, Lcom/android/vending/licensing/ServerManagedPolicy;-><init>(Landroid/content/Context;Lcom/android/vending/licensing/Obfuscator;)V

    const-string v3, "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAhSD8C0tzFQaIqLqhk2S07MOsnGd2x3eGjTMt8W19WSTFjo5zYU5VDIZVyIgwjR1OvoeAdedyIsDAgbnIAHZs386BmIPIHPNWwyPMq28b6N66Ppz8pHkaR3G8d/nwtj2EPWZldlJEat8SO9hNztBk7FKlr0FnXj/L4SAN80os1O8gk2anrSMWuC407sjVOW9moGzgW0kEUC/TF3Te5yqNL6gS1n1bLSF3y5WA3dORBLm+zdyezCj2/VnLcoOVhNG6nhamH1n8h98jSCfZYlsK6AY3DTO1siNGxQK+NAIVsFkD3WdwUobQiM8Pv2POMYhRrKrGpZQd0es5A8pbLd2DHQIDAQAB"

    invoke-direct {v1, p0, v2, v3}, Lcom/android/vending/licensing/LicenseChecker;-><init>(Landroid/content/Context;Lcom/android/vending/licensing/Policy;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/wordnet/dic/synonym/Intro_Activity_Google;->mChecker:Lcom/android/vending/licensing/LicenseChecker;

    .line 36
    iget-object v1, p0, Lcom/wordnet/dic/synonym/Intro_Activity_Google;->mChecker:Lcom/android/vending/licensing/LicenseChecker;

    iget-object v2, p0, Lcom/wordnet/dic/synonym/Intro_Activity_Google;->mLicenseCheckerCallback:Lcom/android/vending/licensing/LicenseCheckerCallback;

    invoke-virtual {v1, v2}, Lcom/android/vending/licensing/LicenseChecker;->checkAccess(Lcom/android/vending/licensing/LicenseCheckerCallback;)V

    # [PATCH] 라이선스 결과와 상관없이 항상 강제 초기화 실행
    invoke-static {p0}, Lcom/wordnet/dic/synonym/Intro_Activity_Google;->access$1(Lcom/wordnet/dic/synonym/Intro_Activity_Google;)V

    .line 40
    return-void
.end method

.method protected onDestory()V
    .locals 1

    .prologue
    .line 127
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 128
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Intro_Activity_Google;->mChecker:Lcom/android/vending/licensing/LicenseChecker;

    invoke-virtual {v0}, Lcom/android/vending/licensing/LicenseChecker;->onDestroy()V

    .line 129
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 94
    invoke-super {p0, p1}, Landroid/app/Activity;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 96
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    .line 97
    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Intro_Activity_Google;->finish()V

    .line 98
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/wordnet/dic/synonym/DicSynonym;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/Intro_Activity_Google;->startActivity(Landroid/content/Intent;)V

    .line 101
    :cond_0
    const/4 v0, 0x0

    return v0
.end method