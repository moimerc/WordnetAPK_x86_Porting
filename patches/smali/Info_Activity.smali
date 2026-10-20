.class public Lcom/wordnet/dic/synonym/Info_Activity;
.super Landroid/app/Activity;
.source "Info_Activity.java"


# instance fields
.field btnCom:Landroid/widget/Button;

.field btnDic:Landroid/widget/Button;

.field curViewMode:Ljava/lang/String;

.field imgViewInfo:Landroid/widget/ImageView;

.field mInfoClickListener:Landroid/view/View$OnClickListener;

.field wm:Landroid/view/WindowManager;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 57
    new-instance v0, Lcom/wordnet/dic/synonym/Info_Activity$1;

    invoke-direct {v0, p0}, Lcom/wordnet/dic/synonym/Info_Activity$1;-><init>(Lcom/wordnet/dic/synonym/Info_Activity;)V

    iput-object v0, p0, Lcom/wordnet/dic/synonym/Info_Activity;->mInfoClickListener:Landroid/view/View$OnClickListener;

    .line 14
    return-void
.end method

.method static synthetic access$0(Lcom/wordnet/dic/synonym/Info_Activity;)V
    .locals 0

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/Info_Activity;->setBtnDicClick()V

    return-void
.end method

.method static synthetic access$1(Lcom/wordnet/dic/synonym/Info_Activity;)V
    .locals 0

    .prologue
    .line 83
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/Info_Activity;->setBtnComClick()V

    return-void
.end method

.method private initialize()V
    .locals 2

    .prologue
    .line 46
    const v0, 0x7f07001c

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/Info_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/wordnet/dic/synonym/Info_Activity;->btnDic:Landroid/widget/Button;

    .line 47
    const v0, 0x7f07001d

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/Info_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/wordnet/dic/synonym/Info_Activity;->btnCom:Landroid/widget/Button;

    .line 49
    const v0, 0x7f07001e

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/Info_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/wordnet/dic/synonym/Info_Activity;->imgViewInfo:Landroid/widget/ImageView;

    .line 51
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Info_Activity;->btnDic:Landroid/widget/Button;

    iget-object v1, p0, Lcom/wordnet/dic/synonym/Info_Activity;->mInfoClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Info_Activity;->btnCom:Landroid/widget/Button;

    iget-object v1, p0, Lcom/wordnet/dic/synonym/Info_Activity;->mInfoClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    const-string v0, "Info_Dic"

    iput-object v0, p0, Lcom/wordnet/dic/synonym/Info_Activity;->curViewMode:Ljava/lang/String;

    .line 55
    return-void
.end method

.method private setBtnComClick()V
    .locals 3

    .prologue
    .line 85
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Info_Activity;->btnDic:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Info_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020003

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 86
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Info_Activity;->btnCom:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Info_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020008

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 88
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Info_Activity;->imgViewInfo:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Info_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020025

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 90
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Info_Activity;->btnDic:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Info_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f040012

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    .line 91
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Info_Activity;->btnCom:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Info_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f040013

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    .line 92
    return-void
.end method

.method private setBtnDicClick()V
    .locals 3

    .prologue
    .line 74
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Info_Activity;->btnDic:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Info_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020004

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 75
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Info_Activity;->btnCom:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Info_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020007

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 77
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Info_Activity;->imgViewInfo:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Info_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020027

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 79
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Info_Activity;->btnDic:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Info_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f040013

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    .line 80
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Info_Activity;->btnCom:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/Info_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f040012

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    .line 81
    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 2

    .prologue
    .line 95
    sget-object v0, Lcom/wordnet/dic/synonym/DicSynonym;->tabHost:Landroid/widget/TabHost;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->setCurrentTab(I)V

    .line 96
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 29
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 31
    iget-object v0, p0, Lcom/wordnet/dic/synonym/Info_Activity;->curViewMode:Ljava/lang/String;

    const-string v1, "Info_Dic"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 32
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/Info_Activity;->setBtnDicClick()V

    .line 36
    :goto_0
    return-void

    .line 34
    :cond_0
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/Info_Activity;->setBtnComClick()V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 22
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 23
    const v0, 0x7f030004

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/Info_Activity;->setContentView(I)V

    .line 25
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/Info_Activity;->initialize()V

    .line 26
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 39
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 41
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/Info_Activity;->setRequestedOrientation(I)V

    .line 42
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/Info_Activity;->setBtnDicClick()V

    .line 43
    return-void
.end method
