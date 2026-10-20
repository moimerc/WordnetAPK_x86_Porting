.class public Lcom/wordnet/dic/synonym/BookMark_Activity;
.super Landroid/app/Activity;
.source "BookMark_Activity.java"


# instance fields
.field arrBookmarkItem:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/wordnet/dic/synonym/data/DataModels;",
            ">;"
        }
    .end annotation
.end field

.field bookmakView:Landroid/widget/LinearLayout;

.field private bookmarkList:Landroid/widget/ListView;

.field private dm:Lcom/wordnet/dic/synonym/data/DataModels;

.field private scrollAdapter:Lcom/wordnet/dic/synonym/common/ScrollAdapter;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 17
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 20
    iput-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->scrollAdapter:Lcom/wordnet/dic/synonym/common/ScrollAdapter;

    .line 21
    iput-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    .line 17
    return-void
.end method

.method static synthetic access$0(Lcom/wordnet/dic/synonym/BookMark_Activity;I)V
    .locals 0

    .prologue
    .line 178
    invoke-direct {p0, p1}, Lcom/wordnet/dic/synonym/BookMark_Activity;->getSaveBookMarkData(I)V

    return-void
.end method

.method static synthetic access$1(Lcom/wordnet/dic/synonym/BookMark_Activity;Lcom/wordnet/dic/synonym/data/DataModels;)V
    .locals 0

    .prologue
    .line 21
    iput-object p1, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    return-void
.end method

.method static synthetic access$2(Lcom/wordnet/dic/synonym/BookMark_Activity;)Lcom/wordnet/dic/synonym/data/DataModels;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    return-object v0
.end method

.method private getSaveBookMarkData(I)V
    .locals 6
    .param p1, "order"    # I

    .prologue
    .line 180
    const/4 v0, 0x0

    .line 183
    .local v0, "cursor":Landroid/database/Cursor;
    :try_start_0
    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->bookmarkHelper:Lcom/wordnet/dic/synonym/data/BookmarkHelper;

    invoke-virtual {v1, p1}, Lcom/wordnet/dic/synonym/data/BookmarkHelper;->getBookmarkData(I)Landroid/database/Cursor;

    move-result-object v0

    .line 184
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->arrBookmarkItem:Ljava/util/ArrayList;

    .line 186
    if-eqz v0, :cond_0

    .line 188
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 190
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 207
    :cond_0
    iget-object v1, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->arrBookmarkItem:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_3

    .line 208
    new-instance v1, Lcom/wordnet/dic/synonym/common/ScrollAdapter;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/BookMark_Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f030007

    iget-object v4, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->arrBookmarkItem:Ljava/util/ArrayList;

    const/4 v5, 0x2

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/wordnet/dic/synonym/common/ScrollAdapter;-><init>(Landroid/content/Context;ILjava/util/ArrayList;I)V

    iput-object v1, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->scrollAdapter:Lcom/wordnet/dic/synonym/common/ScrollAdapter;

    .line 209
    iget-object v1, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->bookmarkList:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->scrollAdapter:Lcom/wordnet/dic/synonym/common/ScrollAdapter;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 216
    :goto_1
    if-eqz v0, :cond_1

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 218
    :cond_1
    :goto_2
    return-void

    .line 191
    :cond_2
    :try_start_1
    new-instance v1, Lcom/wordnet/dic/synonym/data/DataModels;

    invoke-direct {v1}, Lcom/wordnet/dic/synonym/data/DataModels;-><init>()V

    iput-object v1, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    .line 193
    iget-object v1, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v2, 0x1

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/wordnet/dic/synonym/data/DataModels;->setIntId(I)V

    .line 194
    iget-object v1, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v2, 0x2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrPyojaeName(Ljava/lang/String;)V

    .line 195
    iget-object v1, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v2, 0x3

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrPyojaeNameEtc(Ljava/lang/String;)V

    .line 196
    iget-object v1, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v2, 0x4

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/wordnet/dic/synonym/data/DataModels;->setIntWordGrade(I)V

    .line 197
    iget-object v1, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v2, 0x5

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrWordClass(Ljava/lang/String;)V

    .line 198
    iget-object v1, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v2, 0x6

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrMean(Ljava/lang/String;)V

    .line 199
    iget-object v1, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v2, 0x7

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrSynFlag(Ljava/lang/String;)V

    .line 200
    iget-object v1, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/16 v2, 0x8

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrAntFlag(Ljava/lang/String;)V

    .line 202
    iget-object v1, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->arrBookmarkItem:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 203
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 213
    :catch_0
    move-exception v1

    .line 216
    if-eqz v0, :cond_1

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_2

    .line 211
    :cond_3
    :try_start_2
    iget-object v1, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->bookmarkList:Landroid/widget/ListView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 215
    :catchall_0
    move-exception v1

    .line 216
    if-eqz v0, :cond_4

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 217
    :cond_4
    throw v1
.end method

.method private initialize()V
    .locals 3

    .prologue
    .line 137
    const v0, 0x7f070001

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/BookMark_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->bookmakView:Landroid/widget/LinearLayout;

    .line 138
    iget-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->bookmakView:Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/BookMark_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020038

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 140
    const v0, 0x7f070002

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/BookMark_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->bookmarkList:Landroid/widget/ListView;

    .line 142
    iget-object v0, p0, Lcom/wordnet/dic/synonym/BookMark_Activity;->bookmarkList:Landroid/widget/ListView;

    new-instance v1, Lcom/wordnet/dic/synonym/BookMark_Activity$3;

    invoke-direct {v1, p0}, Lcom/wordnet/dic/synonym/BookMark_Activity$3;-><init>(Lcom/wordnet/dic/synonym/BookMark_Activity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 176
    return-void
.end method

.method private itemCallback(Landroid/view/MenuItem;)Z
    .locals 6
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v5, 0x0

    const/4 v1, 0x1

    .line 66
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 132
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 69
    :pswitch_0
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/BookMark_Activity;->getParent()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 70
    const-string v3, "\uc815\ub82c\ubc29\ubc95"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 71
    const/high16 v3, 0x7f050000

    .line 72
    new-instance v4, Lcom/wordnet/dic/synonym/BookMark_Activity$1;

    invoke-direct {v4, p0}, Lcom/wordnet/dic/synonym/BookMark_Activity$1;-><init>(Lcom/wordnet/dic/synonym/BookMark_Activity;)V

    .line 71
    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setItems(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 94
    const-string v3, "\ucde8\uc18c"

    invoke-virtual {v2, v3, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 95
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 101
    :pswitch_1
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/wordnet/dic/synonym/BookMark_Del_Activity;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 102
    .local v0, "intent":Landroid/content/Intent;
    const/high16 v2, 0x4000000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 104
    sget-object v2, Lcom/wordnet/dic/synonym/Group_BookMark_Activity;->groupBookMark:Lcom/wordnet/dic/synonym/Group_BookMark_Activity;

    .line 105
    sget-object v3, Lcom/wordnet/dic/synonym/Group_BookMark_Activity;->groupBookMark:Lcom/wordnet/dic/synonym/Group_BookMark_Activity;

    invoke-virtual {v3}, Lcom/wordnet/dic/synonym/Group_BookMark_Activity;->getLocalActivityManager()Landroid/app/LocalActivityManager;

    move-result-object v3

    .line 106
    const-string v4, "BookMark_Del_Activity"

    invoke-virtual {v3, v4, v0}, Landroid/app/LocalActivityManager;->startActivity(Ljava/lang/String;Landroid/content/Intent;)Landroid/view/Window;

    move-result-object v3

    .line 107
    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v3

    .line 104
    invoke-virtual {v2, v3}, Lcom/wordnet/dic/synonym/Group_BookMark_Activity;->replaseView(Landroid/view/View;)V

    goto :goto_0

    .line 113
    .end local v0    # "intent":Landroid/content/Intent;
    :pswitch_2
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/BookMark_Activity;->getParent()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 114
    const-string v3, "\uc804\uccb4\uc0ad\uc81c"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 115
    const-string v3, "\uc815\ub9d0\ub85c \uc804\uccb4\uc0ad\uc81c \ud558\uc2dc\uaca0\uc2b5\ub2c8\uae4c?"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 116
    const v3, 0x7f020014

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 117
    const-string v3, "\uc608"

    new-instance v4, Lcom/wordnet/dic/synonym/BookMark_Activity$2;

    invoke-direct {v4, p0}, Lcom/wordnet/dic/synonym/BookMark_Activity$2;-><init>(Lcom/wordnet/dic/synonym/BookMark_Activity;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 127
    const-string v3, "\uc544\ub2c8\uc624"

    invoke-virtual {v2, v3, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 128
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 66
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public onBackPressed()V
    .locals 2

    .prologue
    .line 221
    sget-object v0, Lcom/wordnet/dic/synonym/DicSynonym;->tabHost:Landroid/widget/TabHost;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->setCurrentTab(I)V

    .line 222
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 27
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 28
    const/high16 v0, 0x7f030000

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/BookMark_Activity;->setContentView(I)V

    .line 30
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/BookMark_Activity;->initialize()V

    .line 31
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    const/4 v2, 0x0

    .line 51
    const/4 v0, 0x2

    const-string v1, "\uc815\ub82c"

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    .line 52
    const v1, 0x7f02002a

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 53
    const/4 v0, 0x3

    const-string v1, "\uc0ad\uc81c"

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    .line 54
    const v1, 0x7f02002b

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 55
    const/4 v0, 0x4

    const-string v1, "\uc804\uccb4\uc0ad\uc81c"

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    .line 56
    const v1, 0x7f02002c

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 58
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 62
    invoke-direct {p0, p1}, Lcom/wordnet/dic/synonym/BookMark_Activity;->itemCallback(Landroid/view/MenuItem;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public onResume()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 34
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 36
    sget-object v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    .line 40
    :cond_0
    const/4 v0, 0x4
    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/BookMark_Activity;->setRequestedOrientation(I)V

    .line 42
    sget v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->curBookMarkAlign:I

    if-nez v0, :cond_1

    .line 43
    invoke-direct {p0, v1}, Lcom/wordnet/dic/synonym/BookMark_Activity;->getSaveBookMarkData(I)V

    .line 44
    sput v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->curBookMarkAlign:I

    .line 48
    :goto_0
    return-void

    .line 46
    :cond_1
    sget v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->curBookMarkAlign:I

    invoke-direct {p0, v0}, Lcom/wordnet/dic/synonym/BookMark_Activity;->getSaveBookMarkData(I)V

    goto :goto_0
.end method
