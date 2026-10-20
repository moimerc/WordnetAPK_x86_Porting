.class Lcom/wordnet/dic/synonym/Intro_Activity_Google$MyLicenseCheckerCallback;
.super Ljava/lang/Object;
.source "Intro_Activity_Google.java"

# interfaces
.implements Lcom/android/vending/licensing/LicenseCheckerCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wordnet/dic/synonym/Intro_Activity_Google;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyLicenseCheckerCallback"
.end annotation


# instance fields
.field private handler:Landroid/os/Handler;

.field final synthetic this$0:Lcom/wordnet/dic/synonym/Intro_Activity_Google;


# direct methods
.method private constructor <init>(Lcom/wordnet/dic/synonym/Intro_Activity_Google;)V
    .locals 1

    .prologue
    .line 42
    iput-object p1, p0, Lcom/wordnet/dic/synonym/Intro_Activity_Google$MyLicenseCheckerCallback;->this$0:Lcom/wordnet/dic/synonym/Intro_Activity_Google;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    new-instance v0, Lcom/wordnet/dic/synonym/Intro_Activity_Google$MyLicenseCheckerCallback$1;

    invoke-direct {v0, p0}, Lcom/wordnet/dic/synonym/Intro_Activity_Google$MyLicenseCheckerCallback$1;-><init>(Lcom/wordnet/dic/synonym/Intro_Activity_Google$MyLicenseCheckerCallback;)V

    iput-object v0, p0, Lcom/wordnet/dic/synonym/Intro_Activity_Google$MyLicenseCheckerCallback;->handler:Landroid/os/Handler;

    return-void
.end method

.method synthetic constructor <init>(Lcom/wordnet/dic/synonym/Intro_Activity_Google;Lcom/wordnet/dic/synonym/Intro_Activity_Google$MyLicenseCheckerCallback;)V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/wordnet/dic/synonym/Intro_Activity_Google$MyLicenseCheckerCallback;-><init>(Lcom/wordnet/dic/synonym/Intro_Activity_Google;)V

    return-void
.end method

.method static synthetic access$1(Lcom/wordnet/dic/synonym/Intro_Activity_Google$MyLicenseCheckerCallback;)Lcom/wordnet/dic/synonym/Intro_Activity_Google;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Intro_Activity_Google$MyLicenseCheckerCallback;->this$0:Lcom/wordnet/dic/synonym/Intro_Activity_Google;

    return-object v0
.end method


# virtual methods
.method public allow()V
    .locals 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Intro_Activity_Google$MyLicenseCheckerCallback;->this$0:Lcom/wordnet/dic/synonym/Intro_Activity_Google;

    invoke-virtual {v0}, Lcom/wordnet/dic/synonym/Intro_Activity_Google;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 50
    :goto_0
    return-void

    .line 49
    :cond_0
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Intro_Activity_Google$MyLicenseCheckerCallback;->handler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0
.end method

.method public applicationError(Lcom/android/vending/licensing/LicenseCheckerCallback$ApplicationErrorCode;)V
    .locals 2
    .param p1, "errorCode"    # Lcom/android/vending/licensing/LicenseCheckerCallback$ApplicationErrorCode;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Intro_Activity_Google$MyLicenseCheckerCallback;->this$0:Lcom/wordnet/dic/synonym/Intro_Activity_Google;

    invoke-virtual {v0}, Lcom/wordnet/dic/synonym/Intro_Activity_Google;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 61
    :goto_0
    return-void

    .line 60
    :cond_0
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Intro_Activity_Google$MyLicenseCheckerCallback;->handler:Landroid/os/Handler;

    # [PATCH] 에러 메시지(0) 대신 성공 메시지(1) 전송
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0
.end method

.method public dontAllow()V
    .locals 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Intro_Activity_Google$MyLicenseCheckerCallback;->this$0:Lcom/wordnet/dic/synonym/Intro_Activity_Google;

    invoke-virtual {v0}, Lcom/wordnet/dic/synonym/Intro_Activity_Google;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 50
    :goto_0
    return-void

    .line 49
    :cond_0
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Intro_Activity_Google$MyLicenseCheckerCallback;->handler:Landroid/os/Handler;

    # [PATCH] 인증 실패 시에도 성공 메시지(1) 전송
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0
.end method