.class public Lcom/wordnet/dic/synonym/History_Activity;
.super Landroid/app/Activity;
.source "History_Activity.java"


# instance fields
.field arrHistoryItem:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/wordnet/dic/synonym/data/DataModels;",
            ">;"
        }
    .end annotation
.end field

.field private historyList:Landroid/widget/ListView;

.field historyView:Landroid/widget/LinearLayout;

.field private scrollAdapter:Lcom/wordnet/dic/synonym/common/ScrollAdapter;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 17
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wordnet/dic/synonym/History_Activity;->scrollAdapter:Lcom/wordnet/dic/synonym/common/ScrollAdapter;

    .line 15
    return-void
.end method

.method private getHistoryData()V
    .locals 6

    .prologue
    .line 65
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/wordnet/dic/synonym/History_Activity;->arrHistoryItem:Ljava/util/ArrayList;

    .line 67
    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    if-eqz v1, :cond_1

    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 69
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 73
    new-instance v1, Lcom/wordnet/dic/synonym/common/ScrollAdapter;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/History_Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f030007

    iget-object v4, p0, Lcom/wordnet/dic/synonym/History_Activity;->arrHistoryItem:Ljava/util/ArrayList;

    const/4 v5, 0x4

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/wordnet/dic/synonym/common/ScrollAdapter;-><init>(Landroid/content/Context;ILjava/util/ArrayList;I)V

    iput-object v1, p0, Lcom/wordnet/dic/synonym/History_Activity;->scrollAdapter:Lcom/wordnet/dic/synonym/common/ScrollAdapter;

    .line 74
    iget-object v1, p0, Lcom/wordnet/dic/synonym/History_Activity;->historyList:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/wordnet/dic/synonym/History_Activity;->scrollAdapter:Lcom/wordnet/dic/synonym/common/ScrollAdapter;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 78
    .end local v0    # "i":I
    :goto_1
    return-void

    .line 70
    .restart local v0    # "i":I
    :cond_0
    iget-object v2, p0, Lcom/wordnet/dic/synonym/History_Activity;->arrHistoryItem:Ljava/util/ArrayList;

    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    sget-object v3, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v4, v0, 0x1

    sub-int/2addr v3, v4

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/wordnet/dic/synonym/data/DataModels;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 76
    .end local v0    # "i":I
    :cond_1
    iget-object v1, p0, Lcom/wordnet/dic/synonym/History_Activity;->historyList:Landroid/widget/ListView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    goto :goto_1
.end method

.method private initialize()V
    .locals 3

    .prologue
    .line 44
    const v0, 0x7f070019

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/History_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/wordnet/dic/synonym/History_Activity;->historyView:Landroid/widget/LinearLayout;

    .line 45
    iget-object v0, p0, Lcom/wordnet/dic/synonym/History_Activity;->historyView:Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/History_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020038

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 47
    const v0, 0x7f07001a

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/History_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/wordnet/dic/synonym/History_Activity;->historyList:Landroid/widget/ListView;

    .line 48
    iget-object v0, p0, Lcom/wordnet/dic/synonym/History_Activity;->historyList:Landroid/widget/ListView;

    new-instance v1, Lcom/wordnet/dic/synonym/History_Activity$1;

    invoke-direct {v1, p0}, Lcom/wordnet/dic/synonym/History_Activity$1;-><init>(Lcom/wordnet/dic/synonym/History_Activity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 61
    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 2

    .prologue
    .line 81
    sget-object v0, Lcom/wordnet/dic/synonym/DicSynonym;->tabHost:Landroid/widget/TabHost;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->setCurrentTab(I)V

    .line 82
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 24
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 25
    const v0, 0x7f030003

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/History_Activity;->setContentView(I)V

    .line 27
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/History_Activity;->initialize()V

    .line 28
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 31
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 33
    sget-object v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 34
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    .line 37
    :cond_0
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/History_Activity;->setRequestedOrientation(I)V

    .line 39
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/History_Activity;->getHistoryData()V

    .line 40
    return-void
.end method
