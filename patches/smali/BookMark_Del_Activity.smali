.class public Lcom/wordnet/dic/synonym/BookMark_Del_Activity;
.super Landroid/app/Activity;
.source "BookMark_Del_Activity.java"


# instance fields
.field arrBookmarkDelItem:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/wordnet/dic/synonym/data/DataModels;",
            ">;"
        }
    .end annotation
.end field

.field private bookmarkDelList:Landroid/widget/ListView;

.field bookmarkDelView:Landroid/widget/LinearLayout;

.field private btnDelete:Landroid/widget/Button;

.field private chkAll:Landroid/widget/CheckBox;

.field private dm:Lcom/wordnet/dic/synonym/data/DataModels;

.field private scrollAdapter:Lcom/wordnet/dic/synonym/common/ScrollAdapter;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 18
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 23
    iput-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->scrollAdapter:Lcom/wordnet/dic/synonym/common/ScrollAdapter;

    .line 24
    iput-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    .line 18
    return-void
.end method

.method static synthetic access$0(Lcom/wordnet/dic/synonym/BookMark_Del_Activity;IZ)V
    .locals 0

    .prologue
    .line 103
    invoke-direct {p0, p1, p2}, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->getSaveBookMarkData(IZ)V

    return-void
.end method

.method static synthetic access$1(Lcom/wordnet/dic/synonym/BookMark_Del_Activity;)Lcom/wordnet/dic/synonym/common/ScrollAdapter;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->scrollAdapter:Lcom/wordnet/dic/synonym/common/ScrollAdapter;

    return-object v0
.end method

.method private getSaveBookMarkData(IZ)V
    .locals 7
    .param p1, "order"    # I
    .param p2, "chk"    # Z

    .prologue
    .line 105
    const/4 v6, 0x0

    .line 108
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_0
    sget-object v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->bookmarkHelper:Lcom/wordnet/dic/synonym/data/BookmarkHelper;

    invoke-virtual {v0, p1}, Lcom/wordnet/dic/synonym/data/BookmarkHelper;->getBookmarkData(I)Landroid/database/Cursor;

    move-result-object v6

    .line 109
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->arrBookmarkDelItem:Ljava/util/ArrayList;

    .line 111
    if-eqz v6, :cond_0

    .line 113
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 115
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 133
    :cond_0
    iget-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->arrBookmarkDelItem:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_3

    .line 134
    new-instance v0, Lcom/wordnet/dic/synonym/common/ScrollAdapter;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f030006

    iget-object v3, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->arrBookmarkDelItem:Ljava/util/ArrayList;

    const/4 v4, 0x3

    move v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/wordnet/dic/synonym/common/ScrollAdapter;-><init>(Landroid/content/Context;ILjava/util/ArrayList;IZ)V

    iput-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->scrollAdapter:Lcom/wordnet/dic/synonym/common/ScrollAdapter;

    .line 135
    iget-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->bookmarkDelList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->scrollAdapter:Lcom/wordnet/dic/synonym/common/ScrollAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 142
    :goto_1
    if-eqz v6, :cond_1

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 144
    :cond_1
    :goto_2
    return-void

    .line 116
    :cond_2
    :try_start_1
    new-instance v0, Lcom/wordnet/dic/synonym/data/DataModels;

    invoke-direct {v0}, Lcom/wordnet/dic/synonym/data/DataModels;-><init>()V

    iput-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    .line 118
    iget-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v1, 0x0

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/wordnet/dic/synonym/data/DataModels;->setIntId(I)V

    .line 119
    iget-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v1, 0x2

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrPyojaeName(Ljava/lang/String;)V

    .line 120
    iget-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v1, 0x3

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrPyojaeNameEtc(Ljava/lang/String;)V

    .line 121
    iget-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v1, 0x4

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/wordnet/dic/synonym/data/DataModels;->setIntWordGrade(I)V

    .line 122
    iget-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v1, 0x5

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrWordClass(Ljava/lang/String;)V

    .line 123
    iget-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v1, 0x6

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrMean(Ljava/lang/String;)V

    .line 124
    iget-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v1, 0x7

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrSynFlag(Ljava/lang/String;)V

    .line 125
    iget-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/16 v1, 0x8

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrAntFlag(Ljava/lang/String;)V

    .line 127
    iget-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->arrBookmarkDelItem:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 128
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 139
    :catch_0
    move-exception v0

    .line 142
    if-eqz v6, :cond_1

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_2

    .line 137
    :cond_3
    :try_start_2
    iget-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->bookmarkDelList:Landroid/widget/ListView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 141
    :catchall_0
    move-exception v0

    .line 142
    if-eqz v6, :cond_4

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 143
    :cond_4
    throw v0
.end method

.method private initialize()V
    .locals 3

    .prologue
    .line 52
    const v0, 0x7f070003

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->bookmarkDelView:Landroid/widget/LinearLayout;

    .line 53
    iget-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->bookmarkDelView:Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020038

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 55
    const v0, 0x7f070004

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->chkAll:Landroid/widget/CheckBox;

    .line 56
    const v0, 0x7f070005

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->btnDelete:Landroid/widget/Button;

    .line 57
    const v0, 0x7f070006

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->bookmarkDelList:Landroid/widget/ListView;

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->arrDelete:Ljava/util/ArrayList;

    .line 60
    iget-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->chkAll:Landroid/widget/CheckBox;

    new-instance v1, Lcom/wordnet/dic/synonym/BookMark_Del_Activity$1;

    invoke-direct {v1, p0}, Lcom/wordnet/dic/synonym/BookMark_Del_Activity$1;-><init>(Lcom/wordnet/dic/synonym/BookMark_Del_Activity;)V

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 71
    iget-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->btnDelete:Landroid/widget/Button;

    new-instance v1, Lcom/wordnet/dic/synonym/BookMark_Del_Activity$2;

    invoke-direct {v1, p0}, Lcom/wordnet/dic/synonym/BookMark_Del_Activity$2;-><init>(Lcom/wordnet/dic/synonym/BookMark_Del_Activity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 101
    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 4

    .prologue
    .line 148
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/wordnet/dic/synonym/BookMark_Activity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 149
    .local v0, "intent":Landroid/content/Intent;
    const/high16 v1, 0x4000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 151
    sget-object v1, Lcom/wordnet/dic/synonym/Group_BookMark_Activity;->groupBookMark:Lcom/wordnet/dic/synonym/Group_BookMark_Activity;

    .line 152
    sget-object v2, Lcom/wordnet/dic/synonym/Group_BookMark_Activity;->groupBookMark:Lcom/wordnet/dic/synonym/Group_BookMark_Activity;

    invoke-virtual {v2}, Lcom/wordnet/dic/synonym/Group_BookMark_Activity;->getLocalActivityManager()Landroid/app/LocalActivityManager;

    move-result-object v2

    .line 153
    const-string v3, "BookMark_Activity"

    invoke-virtual {v2, v3, v0}, Landroid/app/LocalActivityManager;->startActivity(Ljava/lang/String;Landroid/content/Intent;)Landroid/view/Window;

    move-result-object v2

    .line 154
    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    .line 151
    invoke-virtual {v1, v2}, Lcom/wordnet/dic/synonym/Group_BookMark_Activity;->replaseView(Landroid/view/View;)V

    .line 156
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 31
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 32
    const v0, 0x7f030001

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->setContentView(I)V

    .line 34
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->initialize()V

    .line 35
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 38
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 40
    const/4 v0, 0x4
    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->setRequestedOrientation(I)V

    .line 42
    sget v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->curBookMarkAlign:I

    if-nez v0, :cond_0

    .line 43
    invoke-direct {p0, v1, v2}, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->getSaveBookMarkData(IZ)V

    .line 44
    sput v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->curBookMarkAlign:I

    .line 48
    :goto_0
    return-void

    .line 46
    :cond_0
    sget v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->curBookMarkAlign:I

    invoke-direct {p0, v0, v2}, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;->getSaveBookMarkData(IZ)V

    goto :goto_0
.end method
