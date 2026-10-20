.class public Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;
.super Landroid/app/Activity;
.source "DicSearch_Synonym_Activity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$CallDicDatabase;,
        Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$CallSearchResultData;
    }
.end annotation


# instance fields
.field arrSearchItem:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/wordnet/dic/synonym/data/DataModels;",
            ">;"
        }
    .end annotation
.end field

.field autoCompleteTextBox:Landroid/widget/EditText;

.field btnAddBookmark:Landroid/widget/Button;

.field btnAntonym:Landroid/widget/Button;

.field btnBackward:Landroid/widget/Button;

.field btnCancel:Landroid/widget/Button;

.field btnForward:Landroid/widget/Button;

.field btnSynonym:Landroid/widget/Button;

.field callDicDatabase:Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$CallDicDatabase;

.field callSearchResultData:Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$CallSearchResultData;

.field private curDBLength:J

.field detailMean:Landroid/widget/TextView;

.field detailPyojaeName:Landroid/widget/TextView;

.field detailPyojaeNameEtc:Landroid/widget/TextView;

.field detailWordClass:Landroid/widget/TextView;

.field detailWordGrade:Landroid/widget/TextView;

.field private dm:Lcom/wordnet/dic/synonym/data/DataModels;

.field downloadDialogShow:Z

.field downloadProgress:Landroid/app/ProgressDialog;

.field downloadProgressShow:Z

.field private final encoding:Ljava/lang/String;

.field mAddBookMark:Landroid/view/View$OnClickListener;

.field mDicClickListener:Landroid/view/View$OnClickListener;

.field private mLockListView:Z

.field mSearchBarClickListener:Landroid/view/View$OnClickListener;

.field private final mimeType:Ljava/lang/String;

.field resultView:Landroid/widget/LinearLayout;

.field private rowCount:I

.field scrollAdapter:Lcom/wordnet/dic/synonym/common/ScrollAdapter;

.field searchProgress:Landroid/app/ProgressDialog;

.field searchProgressShow:Z

.field searchView:Landroid/widget/LinearLayout;

.field private strHtml:Ljava/lang/String;

.field suggestListView:Landroid/widget/ListView;

.field private tempLength:I

.field webViewResult:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 51
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 53
    const-string v0, "text/html"

    iput-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->mimeType:Ljava/lang/String;

    .line 54
    const-string v0, "utf-8"

    iput-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->encoding:Ljava/lang/String;

    .line 59
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    .line 61
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->mLockListView:Z

    .line 62
    iput v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->rowCount:I

    .line 63
    iput v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->tempLength:I

    .line 64
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->curDBLength:J

    .line 79
    iput-boolean v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->searchProgressShow:Z

    .line 83
    iput-boolean v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->downloadDialogShow:Z

    .line 84
    iput-boolean v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->downloadProgressShow:Z

    .line 1053
    new-instance v0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$1;

    invoke-direct {v0, p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$1;-><init>(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V

    iput-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->mDicClickListener:Landroid/view/View$OnClickListener;

    .line 1098
    new-instance v0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$2;

    invoke-direct {v0, p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$2;-><init>(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V

    iput-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->mAddBookMark:Landroid/view/View$OnClickListener;

    .line 1132
    new-instance v0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$3;

    invoke-direct {v0, p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$3;-><init>(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V

    iput-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->mSearchBarClickListener:Landroid/view/View$OnClickListener;

    .line 51
    return-void
.end method

.method static synthetic access$0(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;Lcom/wordnet/dic/synonym/data/DataModels;)V
    .locals 0

    .prologue
    .line 59
    iput-object p1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    return-void
.end method

.method static synthetic access$1(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)Lcom/wordnet/dic/synonym/data/DataModels;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    return-object v0
.end method

.method static synthetic access$10(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$11(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V
    .locals 0

    .prologue
    .line 1230
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->setHistoryBtnEnable()V

    return-void
.end method

.method static synthetic access$12(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V
    .locals 0

    .prologue
    .line 312
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->setDisplay()V

    return-void
.end method

.method static synthetic access$13(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V
    .locals 0

    .prologue
    .line 564
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getSuggestList()V

    return-void
.end method

.method static synthetic access$14(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V
    .locals 0

    .prologue
    .line 381
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->chkNetwork()V

    return-void
.end method

.method static synthetic access$15(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)Z
    .locals 1

    .prologue
    .line 61
    iget-boolean v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->mLockListView:Z

    return v0
.end method

.method static synthetic access$16(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V
    .locals 0

    .prologue
    .line 633
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->addSuggestListItem()V

    return-void
.end method

.method static synthetic access$17(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;Z)V
    .locals 0

    .prologue
    .line 61
    iput-boolean p1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->mLockListView:Z

    return-void
.end method

.method static synthetic access$18(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;Landroid/database/Cursor;)V
    .locals 0

    .prologue
    .line 1157
    invoke-direct {p0, p1}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->setSearchHistory(Landroid/database/Cursor;)V

    return-void
.end method

.method static synthetic access$19(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V
    .locals 0

    .prologue
    .line 415
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getDic_DB()V

    return-void
.end method

.method static synthetic access$2(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V
    .locals 0

    .prologue
    .line 695
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->setDicSelectButton()V

    return-void
.end method

.method static synthetic access$20(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)I
    .locals 1

    .prologue
    .line 62
    iget v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->rowCount:I

    return v0
.end method

.method static synthetic access$21(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;I)V
    .locals 0

    .prologue
    .line 62
    iput p1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->rowCount:I

    return-void
.end method

.method static synthetic access$3(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V
    .locals 0

    .prologue
    .line 715
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->setResultData()V

    return-void
.end method

.method static synthetic access$4(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;I)V
    .locals 0

    .prologue
    .line 1206
    invoke-direct {p0, p1}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->setHistoryBar(I)V

    return-void
.end method

.method static synthetic access$5(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)J
    .locals 2

    .prologue
    .line 64
    iget-wide v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->curDBLength:J

    return-wide v0
.end method

.method static synthetic access$6(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;I)V
    .locals 0

    .prologue
    .line 63
    iput p1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->tempLength:I

    return-void
.end method

.method static synthetic access$7(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)I
    .locals 1

    .prologue
    .line 63
    iget v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->tempLength:I

    return v0
.end method

.method static synthetic access$8(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;ILjava/lang/String;)I
    .locals 1

    .prologue
    .line 817
    invoke-direct {p0, p1, p2}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->setResultWebView(ILjava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$9(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;ILjava/lang/String;)V
    .locals 0

    .prologue
    .line 793
    invoke-direct {p0, p1, p2}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->setResultWebViewTitle(ILjava/lang/String;)V

    return-void
.end method

.method private addSuggestListItem()V
    .locals 4

    .prologue
    .line 635
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->mLockListView:Z

    .line 637
    new-instance v1, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$14;

    invoke-direct {v1, p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$14;-><init>(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V

    .line 691
    .local v1, "run":Ljava/lang/Runnable;
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 692
    .local v0, "handler":Landroid/os/Handler;
    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 693
    return-void
.end method

.method private chkNetwork()V
    .locals 3

    .prologue
    .line 382
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getNetworkState()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 403
    :goto_0
    return-void

    .line 384
    :pswitch_0
    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getParent()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "\ud604\uc7ac \ub124\ud06c\uc6cc\ud06c\uc5d0 \uc5f0\uacb0\ub418\uc5b4 \uc788\uc9c0 \uc54a\uc2b5\ub2c8\ub2e4. \n\uc5f0\uacb0 \uc0c1\ud0dc\ub97c \ud655\uc778\ud574 \uc8fc\uc138\uc694."

    invoke-static {v0, v1}, Lcom/wordnet/dic/synonym/common/CommonUtil;->showMessageBox(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 387
    :pswitch_1
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getParent()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 388
    const-string v1, "\uc811\uc18d\uc0c1\ud0dc\ud655\uc778"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 389
    const-string v1, "\ud604\uc7ac 3G\ub9dd\uc73c\ub85c \uc5f0\uacb0\ub418\uc5b4 \uc788\uc5b4 \uac00\uc785\ud558\uc2e0 \uc694\uae08\uc81c\uc5d0 \ub530\ub77c \ub9dd\uc0ac\uc6a9\uc694\uae08\uc774 \ubd80\uacfc\ub420 \uc218\ub3c4 \uc788\uc2b5\ub2c8\ub2e4. \n\uc9c0\uae08 \ub2e4\uc6b4\ub85c\ub4dc \ud558\uc2dc\uaca0\uc2b5\ub2c8\uae4c?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 390
    const v1, 0x7f020011

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 391
    const-string v1, "\uc608"

    new-instance v2, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$11;

    invoke-direct {v2, p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$11;-><init>(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 396
    const-string v1, "\uc544\ub2c8\uc624"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 397
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 400
    :pswitch_2
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getDic_DB()V

    goto :goto_0

    .line 382
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private dataRequestToDB(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 11
    .param p1, "id"    # I
    .param p2, "strGrade"    # Ljava/lang/String;
    .param p3, "strDicGubn"    # Ljava/lang/String;

    .prologue
    .line 954
    const/4 v0, 0x0

    .line 955
    .local v0, "arrFirst":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/wordnet/dic/synonym/data/DataModels;>;"
    const/4 v1, 0x0

    .line 957
    .local v1, "arrSecond":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/wordnet/dic/synonym/data/DataModels;>;"
    const/4 v2, 0x0

    .line 961
    .local v2, "bolResult":Z
    :try_start_0
    const-string v8, "\uc720"

    invoke-virtual {p3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 962
    sget-object v8, Lcom/wordnet/dic/synonym/common/CommonVariable;->mDBHelper:Lcom/wordnet/dic/synonym/data/DatabaseHelper;

    invoke-virtual {v8, p1, p2}, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->getDicSynonymData(ILjava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 967
    :goto_0
    if-eqz v0, :cond_d

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lez v8, :cond_d

    .line 971
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v8

    if-lt v5, v8, :cond_3

    .line 1030
    const/4 v2, 0x1

    .line 1039
    .end local v5    # "i":I
    :goto_2
    if-eqz v0, :cond_0

    .line 1040
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1041
    const/4 v0, 0x0

    .line 1044
    :cond_0
    if-eqz v1, :cond_1

    .line 1045
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 1046
    const/4 v1, 0x0

    .line 1050
    :cond_1
    :goto_3
    return v2

    .line 964
    :cond_2
    :try_start_1
    sget-object v8, Lcom/wordnet/dic/synonym/common/CommonVariable;->mDBHelper:Lcom/wordnet/dic/synonym/data/DatabaseHelper;

    invoke-virtual {v8, p1, p2}, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->getDicAntonymData(ILjava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    goto :goto_0

    .line 973
    .restart local v5    # "i":I
    :cond_3
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/wordnet/dic/synonym/data/DataModels;

    .line 975
    .local v3, "dmFirst":Lcom/wordnet/dic/synonym/data/DataModels;
    iget-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "<tr>"

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 977
    rem-int/lit8 v8, v5, 0x2

    if-nez v8, :cond_4

    .line 978
    iget-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "<td>"

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 983
    :goto_4
    iget-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "<a href=\'http://localhost|"

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Lcom/wordnet/dic/synonym/data/DataModels;->getStrId()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\' class=\'no_uline  first\'>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 984
    invoke-virtual {v3}, Lcom/wordnet/dic/synonym/data/DataModels;->getStrPyojaeName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Lcom/wordnet/dic/synonym/data/DataModels;->getStrPyojaeNameEtc()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "</a>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 986
    iget-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "</td>"

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 988
    rem-int/lit8 v8, v5, 0x2

    if-nez v8, :cond_6

    .line 989
    iget-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "<td>"

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 994
    :goto_5
    sget-object v8, Lcom/wordnet/dic/synonym/common/CommonVariable;->mDBHelper:Lcom/wordnet/dic/synonym/data/DatabaseHelper;

    invoke-virtual {v3}, Lcom/wordnet/dic/synonym/data/DataModels;->getIntId()I

    move-result v9

    sget-object v10, Lcom/wordnet/dic/synonym/common/CommonVariable;->pref_SecondGrade:Ljava/lang/String;

    invoke-static {v10}, Lcom/wordnet/dic/synonym/common/CommonUtil;->getWordGradeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->getDicSynonymData(ILjava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 996
    if-eqz v1, :cond_b

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lez v8, :cond_b

    .line 999
    const-string v7, ""

    .line 1001
    .local v7, "strSecondHtml":Ljava/lang/String;
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_6
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lt v6, v8, :cond_9

    .line 1013
    iget-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 1014
    iget-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "</td>"

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 1016
    const-string v8, ""

    .line 1027
    .end local v6    # "j":I
    .end local v7    # "strSecondHtml":Ljava/lang/String;
    :goto_7
    iget-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "</tr>"

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 971
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_1

    .line 980
    :cond_4
    iget-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "<td style=\'background-color:rgba(0,0,0,0.02)\'>"

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_4

    .line 1036
    .end local v3    # "dmFirst":Lcom/wordnet/dic/synonym/data/DataModels;
    .end local v5    # "i":I
    :catch_0
    move-exception v8

    .line 1039
    if-eqz v0, :cond_5

    .line 1040
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1041
    const/4 v0, 0x0

    .line 1044
    :cond_5
    if-eqz v1, :cond_1

    .line 1045
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 1046
    const/4 v1, 0x0

    goto/16 :goto_3

    .line 991
    .restart local v3    # "dmFirst":Lcom/wordnet/dic/synonym/data/DataModels;
    .restart local v5    # "i":I
    :cond_6
    :try_start_2
    iget-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "<td style=\'background-color:rgba(0,0,0,0.02)\'>"

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_5

    .line 1038
    .end local v3    # "dmFirst":Lcom/wordnet/dic/synonym/data/DataModels;
    .end local v5    # "i":I
    :catchall_0
    move-exception v8

    .line 1039
    if-eqz v0, :cond_7

    .line 1040
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1041
    const/4 v0, 0x0

    .line 1044
    :cond_7
    if-eqz v1, :cond_8

    .line 1045
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 1046
    const/4 v1, 0x0

    .line 1048
    :cond_8
    throw v8

    .line 1003
    .restart local v3    # "dmFirst":Lcom/wordnet/dic/synonym/data/DataModels;
    .restart local v5    # "i":I
    .restart local v6    # "j":I
    .restart local v7    # "strSecondHtml":Ljava/lang/String;
    :cond_9
    :try_start_3
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/wordnet/dic/synonym/data/DataModels;

    .line 1005
    .local v4, "dmSecond":Lcom/wordnet/dic/synonym/data/DataModels;
    const-string v8, ""

    if-eq v7, v8, :cond_a

    .line 1006
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, ", "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 1009
    :cond_a
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, "<a href=\'http://localhost|"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v4}, Lcom/wordnet/dic/synonym/data/DataModels;->getStrId()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\' class=\'no_uline  first\'>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 1010
    invoke-virtual {v4}, Lcom/wordnet/dic/synonym/data/DataModels;->getStrPyojaeName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v4}, Lcom/wordnet/dic/synonym/data/DataModels;->getStrPyojaeNameEtc()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "</a>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 1009
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 1001
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_6

    .line 1020
    .end local v4    # "dmSecond":Lcom/wordnet/dic/synonym/data/DataModels;
    .end local v6    # "j":I
    .end local v7    # "strSecondHtml":Ljava/lang/String;
    :cond_b
    rem-int/lit8 v8, v5, 0x2

    if-nez v8, :cond_c

    .line 1021
    iget-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "<td></td>"

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    goto/16 :goto_7

    .line 1023
    :cond_c
    iget-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "<td style=\'background-color:rgba(0,0,0,0.02)\'></td>"

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_7

    .line 1033
    .end local v3    # "dmFirst":Lcom/wordnet/dic/synonym/data/DataModels;
    .end local v5    # "i":I
    :cond_d
    const/4 v2, 0x0

    goto/16 :goto_2
.end method

.method private dbCheck()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    const v6, 0x7f020016

    .line 339
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    .line 340
    .local v0, "SDCard":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "wordnet"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".dicPyojaeEnc20140812.db"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 342
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 343
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v2

    const-wide/32 v4, 0x2b6f800

    cmp-long v2, v2, v4

    if-ltz v2, :cond_1

    .line 344
    const/4 v2, 0x1

    sput-boolean v2, Lcom/wordnet/dic/synonym/common/CommonVariable;->chkDB:Z

    .line 345
    sget-object v2, Lcom/wordnet/dic/synonym/common/CommonVariable;->mDBHelper:Lcom/wordnet/dic/synonym/data/DatabaseHelper;

    if-nez v2, :cond_0

    .line 346
    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getParent()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->getInstance(Landroid/content/Context;)Lcom/wordnet/dic/synonym/data/DatabaseHelper;

    move-result-object v2

    sput-object v2, Lcom/wordnet/dic/synonym/common/CommonVariable;->mDBHelper:Lcom/wordnet/dic/synonym/data/DatabaseHelper;

    .line 379
    :cond_0
    :goto_0
    return-void

    .line 350
    :cond_1
    iget-boolean v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->downloadProgressShow:Z

    if-nez v2, :cond_0

    .line 352
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->curDBLength:J

    .line 354
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getParent()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 355
    const-string v3, "\ud30c\uc77c\uc774\uc5b4\ubc1b\uae30"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 356
    const-string v3, "\uc0ac\uc804\ub370\uc774\ud130\uac00 \uc77c\ubd80\ub9cc \uc874\uc7ac\ud569\ub2c8\ub2e4.\n\uc774\uc5b4\ubc1b\uae30 \ud558\uc2dc\uaca0\uc2b5\ub2c8\uae4c?"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 357
    invoke-virtual {v2, v6}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 358
    const-string v3, "\uc608"

    new-instance v4, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$9;

    invoke-direct {v4, p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$9;-><init>(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 363
    const-string v3, "\uc544\ub2c8\uc624"

    invoke-virtual {v2, v3, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 364
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 367
    :cond_2
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getParent()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 368
    const-string v3, "\ud30c\uc77c\ub2e4\uc6b4\ub85c\ub4dc"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 369
    const-string v3, "\uc0ac\uc804\ub370\uc774\ud130\ub97c \ub2e4\uc6b4\ub85c\ub4dc \ud558\uc2dc\uaca0\uc2b5\ub2c8\uae4c?"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 370
    invoke-virtual {v2, v6}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 371
    const-string v3, "\uc608"

    new-instance v4, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$10;

    invoke-direct {v4, p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$10;-><init>(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 376
    const-string v3, "\uc544\ub2c8\uc624"

    invoke-virtual {v2, v3, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 377
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method private getDic_DB()V
    .locals 11

    .prologue
    .line 417
    new-instance v4, Landroid/os/StatFs;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v7}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 419
    .local v4, "stat":Landroid/os/StatFs;
    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockSize()I

    move-result v7

    int-to-long v2, v7

    .line 420
    .local v2, "blockSize":J
    invoke-virtual {v4}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v7

    int-to-long v0, v7

    .line 421
    .local v0, "availableBlocks":J
    mul-long v5, v2, v0

    .line 423
    .local v5, "totalAvailableSize":J
    const-wide/32 v7, 0x2b6f800

    cmp-long v7, v5, v7

    if-gez v7, :cond_0

    .line 424
    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getParent()Landroid/app/Activity;

    move-result-object v7

    const-string v8, "SD\uce74\ub4dc\uc758 \uc800\uc7a5 \uacf5\uac04\uc774 \ubd80\uc871\ud569\ub2c8\ub2e4."

    invoke-static {v7, v8}, Lcom/wordnet/dic/synonym/common/CommonUtil;->showMessageBox(Landroid/content/Context;Ljava/lang/String;)V

    .line 430
    :goto_0
    return-void

    .line 428
    :cond_0
    new-instance v7, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$CallDicDatabase;

    const/4 v8, 0x0

    invoke-direct {v7, p0, v8}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$CallDicDatabase;-><init>(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$CallDicDatabase;)V

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->callDicDatabase:Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$CallDicDatabase;

    .line 429
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->callDicDatabase:Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$CallDicDatabase;

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    const-string v10, ""

    aput-object v10, v8, v9

    invoke-virtual {v7, v8}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$CallDicDatabase;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0
.end method

.method private getNetworkState()I
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 407
    const-string v3, "connectivity"

    invoke-virtual {p0, v3}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 409
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v1, 0x2

    .line 412
    :cond_0
    :goto_0
    return v1

    .line 410
    :cond_1
    invoke-virtual {v0, v2}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 412
    goto :goto_0
.end method

.method private getSuggestList()V
    .locals 7

    .prologue
    .line 566
    const/4 v0, 0x0

    .line 568
    .local v0, "cursor":Landroid/database/Cursor;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->arrSearchItem:Ljava/util/ArrayList;

    .line 572
    :try_start_0
    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->autoCompleteTextBox:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 574
    sget-object v2, Lcom/wordnet/dic/synonym/common/CommonVariable;->mDBHelper:Lcom/wordnet/dic/synonym/data/DatabaseHelper;

    iget-object v3, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->autoCompleteTextBox:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->getAutoCompleteData(Ljava/lang/String;)Lnet/sqlcipher/Cursor;

    move-result-object v0

    .line 576
    if-eqz v0, :cond_1

    .line 578
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 580
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_1

    .line 582
    :cond_0
    new-instance v2, Lcom/wordnet/dic/synonym/data/DataModels;

    invoke-direct {v2}, Lcom/wordnet/dic/synonym/data/DataModels;-><init>()V

    iput-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    .line 584
    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v3, 0x0

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/wordnet/dic/synonym/data/DataModels;->setIntId(I)V

    .line 585
    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v3, 0x1

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrPyojaeName(Ljava/lang/String;)V

    .line 586
    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v3, 0x2

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrPyojaeNameEtc(Ljava/lang/String;)V

    .line 587
    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v3, 0x3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/wordnet/dic/synonym/data/DataModels;->setIntWordGrade(I)V

    .line 588
    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v3, 0x4

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrWordClass(Ljava/lang/String;)V

    .line 589
    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v3, 0x5

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrMean(Ljava/lang/String;)V

    .line 590
    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v3, 0x6

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrSynFlag(Ljava/lang/String;)V

    .line 591
    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v3, 0x7

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrAntFlag(Ljava/lang/String;)V

    .line 593
    iget v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->rowCount:I

    rem-int/lit8 v2, v2, 0x2

    if-nez v2, :cond_3

    .line 594
    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const-string v3, "#00000000"

    invoke-virtual {v2, v3}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrColor(Ljava/lang/String;)V

    .line 599
    :goto_0
    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->arrSearchItem:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 601
    iget v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->rowCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->rowCount:I

    .line 603
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 607
    :cond_1
    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->arrSearchItem:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_4

    .line 608
    new-instance v2, Lcom/wordnet/dic/synonym/common/ScrollAdapter;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f030009

    iget-object v5, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->arrSearchItem:Ljava/util/ArrayList;

    const/4 v6, 0x1

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/wordnet/dic/synonym/common/ScrollAdapter;-><init>(Landroid/content/Context;ILjava/util/ArrayList;I)V

    iput-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->scrollAdapter:Lcom/wordnet/dic/synonym/common/ScrollAdapter;

    .line 609
    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->suggestListView:Landroid/widget/ListView;

    iget-object v3, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->scrollAdapter:Lcom/wordnet/dic/synonym/common/ScrollAdapter;

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 629
    :goto_1
    if-eqz v0, :cond_2

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 631
    :cond_2
    :goto_2
    return-void

    .line 596
    :cond_3
    :try_start_1
    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const-string v3, "#03000000"

    invoke-virtual {v2, v3}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrColor(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 617
    :catch_0
    move-exception v1

    .line 618
    .local v1, "e":Ljava/lang/Exception;
    :try_start_2
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getParent()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 619
    const-string v3, "\uc0ac\uc804\ub370\uc774\ud130 \uc624\ub958\ubc1c\uc0dd"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 620
    const-string v3, "\uc0ac\uc804\ub370\uc774\ud130 \uc624\ub958\ub85c \uc778\ud574 \uac80\uc0c9\uc744 \uc2dc\ud589\ud560 \uc218 \uc5c6\uc2b5\ub2c8\ub2e4.\n\ud658\uacbd\uc124\uc815 > \ub370\uc774\ud130\ud30c\uc77c\uc0ad\uc81c \ud6c4 \ub2e4\uc2dc \ubc1b\uc73c\uc2dc\uae30 \ubc14\ub78d\ub2c8\ub2e4. \ud574\ub2f9 \ubb38\uc81c\uac00 \uacc4\uc18d \ubc1c\uc0dd\ud560 \uacbd\uc6b0 \uba54\uc77c(master@natmal.com) \ud639\uc740 \uc804\ud654(070-7728-3016)\ub85c \ubb38\uc758 \ubc14\ub78d\ub2c8\ub2e4."

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 621
    const v3, 0x7f020013

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 622
    const-string v3, "\uc608"

    new-instance v4, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$13;

    invoke-direct {v4, p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$13;-><init>(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 627
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 629
    if-eqz v0, :cond_2

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_2

    .line 611
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_4
    :try_start_3
    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->suggestListView:Landroid/widget/ListView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 628
    :catchall_0
    move-exception v2

    .line 629
    if-eqz v0, :cond_5

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 630
    :cond_5
    throw v2

    .line 615
    :cond_6
    :try_start_4
    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->suggestListView:Landroid/widget/ListView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1
.end method

.method private initialize()V
    .locals 3

    .prologue
    .line 97
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->setRequestedOrientation(I)V

    .line 99
    const v1, 0x7f07000b

    invoke-virtual {p0, v1}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->searchView:Landroid/widget/LinearLayout;

    .line 100
    const v1, 0x7f07000d

    invoke-virtual {p0, v1}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->resultView:Landroid/widget/LinearLayout;

    .line 103
    const v1, 0x7f070008

    invoke-virtual {p0, v1}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->autoCompleteTextBox:Landroid/widget/EditText;

    .line 104
    const v1, 0x7f070007

    invoke-virtual {p0, v1}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnBackward:Landroid/widget/Button;

    .line 105
    const v1, 0x7f07000a

    invoke-virtual {p0, v1}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnForward:Landroid/widget/Button;

    .line 106
    const v1, 0x7f070009

    invoke-virtual {p0, v1}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnCancel:Landroid/widget/Button;

    .line 108
    new-instance v0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$4;

    invoke-direct {v0, p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$4;-><init>(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V

    .line 144
    .local v0, "watcher":Landroid/text/TextWatcher;
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->autoCompleteTextBox:Landroid/widget/EditText;

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 145
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->autoCompleteTextBox:Landroid/widget/EditText;

    new-instance v2, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$5;

    invoke-direct {v2, p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$5;-><init>(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 156
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnBackward:Landroid/widget/Button;

    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->mSearchBarClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 157
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnForward:Landroid/widget/Button;

    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->mSearchBarClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 158
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnCancel:Landroid/widget/Button;

    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->mSearchBarClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 162
    const v1, 0x7f07000c

    invoke-virtual {p0, v1}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->suggestListView:Landroid/widget/ListView;

    .line 163
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->suggestListView:Landroid/widget/ListView;

    new-instance v2, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$6;

    invoke-direct {v2, p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$6;-><init>(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 190
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->suggestListView:Landroid/widget/ListView;

    new-instance v2, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$7;

    invoke-direct {v2, p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$7;-><init>(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 244
    const v1, 0x7f070012

    invoke-virtual {p0, v1}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->detailPyojaeName:Landroid/widget/TextView;

    .line 245
    const v1, 0x7f070013

    invoke-virtual {p0, v1}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->detailPyojaeNameEtc:Landroid/widget/TextView;

    .line 246
    const v1, 0x7f070016

    invoke-virtual {p0, v1}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->detailMean:Landroid/widget/TextView;

    .line 247
    const v1, 0x7f070011

    invoke-virtual {p0, v1}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->detailWordGrade:Landroid/widget/TextView;

    .line 248
    const v1, 0x7f070014

    invoke-virtual {p0, v1}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->detailWordClass:Landroid/widget/TextView;

    .line 250
    const v1, 0x7f07000f

    invoke-virtual {p0, v1}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnSynonym:Landroid/widget/Button;

    .line 251
    const v1, 0x7f070010

    invoke-virtual {p0, v1}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnAntonym:Landroid/widget/Button;

    .line 252
    const v1, 0x7f070015

    invoke-virtual {p0, v1}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnAddBookmark:Landroid/widget/Button;

    .line 254
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnSynonym:Landroid/widget/Button;

    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->mDicClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 255
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnAntonym:Landroid/widget/Button;

    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->mDicClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 256
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnAddBookmark:Landroid/widget/Button;

    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->mAddBookMark:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 258
    const v1, 0x7f070017

    invoke-virtual {p0, v1}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/webkit/WebView;

    iput-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->webViewResult:Landroid/webkit/WebView;

    .line 259
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->webViewResult:Landroid/webkit/WebView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 260
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->webViewResult:Landroid/webkit/WebView;

    new-instance v2, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$8;

    invoke-direct {v2, p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$8;-><init>(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 282
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->setHistoryBtnEnable()V

    .line 283
    return-void
.end method

.method private setDicSelectButton()V
    .locals 5

    .prologue
    const v4, 0x7f040013

    const v3, 0x7f040012

    .line 697
    sget-object v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->curDic:Ljava/lang/String;

    const-string v1, "\uc720"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 699
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnSynonym:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020004

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 700
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnSynonym:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    .line 702
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnAntonym:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020007

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 703
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnAntonym:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    .line 713
    :goto_0
    return-void

    .line 707
    :cond_0
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnSynonym:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020003

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 708
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnSynonym:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    .line 710
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnAntonym:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020008

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 711
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnAntonym:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    goto :goto_0
.end method

.method private setDisplay()V
    .locals 2

    .prologue
    .line 314
    sget-object v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->curViewMode:Ljava/lang/String;

    const-string v1, "searchView"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 315
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->searchView:Landroid/widget/LinearLayout;

    sget v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->SHOW:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 316
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->resultView:Landroid/widget/LinearLayout;

    sget v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->HIDE:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 335
    :goto_0
    return-void

    .line 318
    :cond_0
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->searchView:Landroid/widget/LinearLayout;

    sget v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->HIDE:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 319
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->resultView:Landroid/widget/LinearLayout;

    sget v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->SHOW:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 321
    sget-boolean v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->historyClick:Z

    if-nez v0, :cond_2

    .line 323
    sget-object v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->curDic:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 324
    const-string v0, "\uc720"

    sput-object v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->curDic:Ljava/lang/String;

    .line 327
    :cond_1
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->setDicSelectButton()V

    .line 328
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->setResultData()V

    goto :goto_0

    .line 331
    :cond_2
    const/4 v0, 0x0

    sput-boolean v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->historyClick:Z

    .line 332
    sget v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->curStackLocation:I

    invoke-direct {p0, v0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->setHistoryBar(I)V

    goto :goto_0
.end method

.method private setDisplayDesign()V
    .locals 4

    .prologue
    const v3, 0x7f020038

    .line 304
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->autoCompleteTextBox:Landroid/widget/EditText;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020031

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 305
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->searchView:Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 306
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->resultView:Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 307
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnCancel:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020033

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 309
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->setDicSelectButton()V

    .line 310
    return-void
.end method

.method private setHistoryBar(I)V
    .locals 3
    .param p1, "position"    # I

    .prologue
    .line 1208
    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 1210
    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wordnet/dic/synonym/data/DataModels;

    .line 1211
    .local v0, "historyDM":Lcom/wordnet/dic/synonym/data/DataModels;
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->setHistoryBtnEnable()V

    .line 1213
    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->curViewMode:Ljava/lang/String;

    const-string v2, "searchView"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1214
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->autoCompleteTextBox:Landroid/widget/EditText;

    invoke-virtual {v0}, Lcom/wordnet/dic/synonym/data/DataModels;->getStrPyojaeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1228
    .end local v0    # "historyDM":Lcom/wordnet/dic/synonym/data/DataModels;
    :cond_0
    :goto_0
    return-void

    .line 1216
    .restart local v0    # "historyDM":Lcom/wordnet/dic/synonym/data/DataModels;
    :cond_1
    invoke-virtual {v0}, Lcom/wordnet/dic/synonym/data/DataModels;->getStrGubn()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Lcom/wordnet/dic/synonym/data/DataModels;->getStrGubn()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\uc720"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1217
    :cond_2
    const-string v1, "\uc720"

    sput-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->curDic:Ljava/lang/String;

    .line 1222
    :goto_1
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->setDicSelectButton()V

    .line 1224
    const/4 v1, 0x1

    sput-boolean v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->historyClick:Z

    .line 1225
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->setResultData()V

    goto :goto_0

    .line 1219
    :cond_3
    const-string v1, "\ubc18"

    sput-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->curDic:Ljava/lang/String;

    goto :goto_1
.end method

.method private setHistoryBtnEnable()V
    .locals 7

    .prologue
    const v6, 0x7f020018

    const v5, 0x7f020002

    const v2, 0x7f020001

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 1231
    sget-object v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    if-eqz v0, :cond_3

    sget-object v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, v3, :cond_3

    .line 1232
    sget v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->curStackLocation:I

    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_1

    .line 1233
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnBackward:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1234
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnForward:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020019

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1235
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnBackward:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1236
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnForward:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1255
    :cond_0
    :goto_0
    return-void

    .line 1237
    :cond_1
    sget v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->curStackLocation:I

    if-lez v0, :cond_2

    .line 1238
    sget v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->curStackLocation:I

    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_2

    .line 1239
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnBackward:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1240
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnForward:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1241
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnBackward:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1242
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnForward:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0

    .line 1243
    :cond_2
    sget v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->curStackLocation:I

    if-nez v0, :cond_0

    .line 1244
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnBackward:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1245
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnForward:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1246
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnBackward:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1247
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnForward:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0

    .line 1250
    :cond_3
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnBackward:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1251
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnForward:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020019

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1252
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnBackward:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1253
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->btnForward:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setEnabled(Z)V

    goto/16 :goto_0
.end method

.method private setResultData()V
    .locals 4

    .prologue
    .line 717
    new-instance v0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$CallSearchResultData;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$CallSearchResultData;-><init>(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$CallSearchResultData;)V

    iput-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->callSearchResultData:Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$CallSearchResultData;

    .line 718
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->callSearchResultData:Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$CallSearchResultData;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, ""

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$CallSearchResultData;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 719
    return-void
.end method

.method private setResultWebView(ILjava/lang/String;)I
    .locals 10
    .param p1, "position"    # I
    .param p2, "strGubn"    # Ljava/lang/String;

    .prologue
    .line 819
    const-string v7, ""

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 820
    const-string v6, ""

    .line 822
    .local v6, "strSecondHtml":Ljava/lang/String;
    const/4 v5, 0x0

    .line 826
    .local v5, "result":I
    :try_start_0
    sget-object v7, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    if-eqz v7, :cond_2

    sget-object v7, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_2

    .line 828
    sget-object v7, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    invoke-virtual {v7, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/wordnet/dic/synonym/data/DataModels;

    .line 830
    .local v3, "historyDM":Lcom/wordnet/dic/synonym/data/DataModels;
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<html><head><meta http-equiv=\u2019Content-Type\u2019 content=\u2019text/html; charset=utf-8\u2032/>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 831
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<style type=\'text/css\'>a.no_uline {text-decoration:none} .tb_1, .tb_1 th, .tb_1 td {border:0;} .tb_1 { margin-top:5px } .tb_1 th {padding:8px;border-bottom:2px solid #cfcfcf; border-top:1px solid #e7e7e7; border-right:1px solid #e7e7e7; text-align:center;} .tb_1 td {padding:6px;border-bottom:1px solid #e7e7e7;border-right:1px solid #e7e7e7; text-align:left;} .bg_f4 { background-color:#ffffff;} .first {color:#000000} .second {color:#444444} .44 { color:#444444;} .00 { color:#000000;} </style></head>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 843
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<body style=\'padding:0;margin:0;\'>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 845
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<table class=\'tb_1\' border=\'1\' cellspacing=\'0\' cellpadding=\'0\' width=\'100&#37\'>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 847
    sget-object v7, Lcom/wordnet/dic/synonym/common/CommonVariable;->pref_SecondGrade:Ljava/lang/String;

    const-string v8, "\ubbf8\uc9c0\uc815"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 849
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<colgroup><col width=\'35&#37\'/><col width=\'65&#37\'/></colgroup>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 850
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<thead><tr>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 852
    const-string v7, "\uc720"

    invoke-virtual {p2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 853
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<th scope=\'col\' class=\'00\' style=\'background-color:rgba(0,0,0,0.05)\'>1\ucc28 \uc720\uc758\uc5b4</th>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 854
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<th scope=\'col\' class=\'44\' style=\'background-color:rgba(0,0,0,0.05)\'>2\ucc28 \uc720\uc758\uc5b4</th>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 870
    :cond_0
    :goto_0
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "</tr></thead></table>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 872
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<table class=\'tb_1\' border=\'1\' cellspacing=\'0\' cellpadding=\'0\' width=\'100&#37\'>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 874
    sget-object v7, Lcom/wordnet/dic/synonym/common/CommonVariable;->pref_SecondGrade:Ljava/lang/String;

    const-string v8, "\ubbf8\uc9c0\uc815"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_7

    .line 875
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<colgroup><col width=\'35&#37\'/><col width=\'65&#37\'/></colgroup>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 876
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<tbody>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 878
    invoke-virtual {v3}, Lcom/wordnet/dic/synonym/data/DataModels;->getIntId()I

    move-result v7

    sget-object v8, Lcom/wordnet/dic/synonym/common/CommonVariable;->pref_FirstGrade:Ljava/lang/String;

    invoke-static {v8}, Lcom/wordnet/dic/synonym/common/CommonUtil;->getWordGradeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v7, v8, p2}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dataRequestToDB(ILjava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 880
    const-string v7, "\uc720"

    invoke-virtual {p2, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 881
    const/4 v5, 0x1

    .line 942
    :cond_1
    :goto_1
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "</tbody></table></body></html>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 943
    const/4 v7, 0x0

    sput-boolean v7, Lcom/wordnet/dic/synonym/common/CommonVariable;->historySave:Z

    .line 949
    .end local v3    # "historyDM":Lcom/wordnet/dic/synonym/data/DataModels;
    :cond_2
    :goto_2
    return v5

    .line 855
    .restart local v3    # "historyDM":Lcom/wordnet/dic/synonym/data/DataModels;
    :cond_3
    const-string v7, "\ubc18"

    invoke-virtual {p2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 856
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<th scope=\'col\' class=\'00\' style=\'background-color:rgba(0,0,0,0.05)\'>1\ucc28 \ubc18\uc758\uc5b4</th>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 857
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<th scope=\'col\' class=\'44\' style=\'background-color:rgba(0,0,0,0.05)\'>2\ucc28 \ubc18\uc758\uc5b4</th>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    goto/16 :goto_0

    .line 945
    .end local v3    # "historyDM":Lcom/wordnet/dic/synonym/data/DataModels;
    :catch_0
    move-exception v2

    .line 946
    .local v2, "e":Ljava/lang/Exception;
    const/16 v5, 0x9

    goto :goto_2

    .line 860
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v3    # "historyDM":Lcom/wordnet/dic/synonym/data/DataModels;
    :cond_4
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<colgroup><col width=\'100&#37\'/></colgroup>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 861
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<thead><tr>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 863
    const-string v7, "\uc720"

    invoke-virtual {p2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 864
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<th scope=\'col\' class=\'00\' style=\'background-color:rgba(0,0,0,0.05)\'>\uc720\uc758\uc5b4</th>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    goto/16 :goto_0

    .line 865
    :cond_5
    const-string v7, "\ubc18"

    invoke-virtual {p2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 866
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<th scope=\'col\' class=\'00\' style=\'background-color:rgba(0,0,0,0.05)\'>\ubc18\uc758\uc5b4</th>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    goto/16 :goto_0

    .line 883
    :cond_6
    const/4 v5, 0x2

    .line 887
    goto/16 :goto_1

    .line 889
    :cond_7
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<colgroup><col width=\'20&#37\'/><col width=\'80&#37\'/></colgroup>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 890
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<tbody>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 891
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<tr>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 893
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 895
    .local v0, "arrSecond":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/wordnet/dic/synonym/data/DataModels;>;"
    const-string v7, "\uc720"

    invoke-virtual {p2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 896
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<td class=\'first\'>\uc720\uc758\uc5b4</td>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 897
    sget-object v7, Lcom/wordnet/dic/synonym/common/CommonVariable;->mDBHelper:Lcom/wordnet/dic/synonym/data/DatabaseHelper;

    invoke-virtual {v3}, Lcom/wordnet/dic/synonym/data/DataModels;->getIntId()I

    move-result v8

    sget-object v9, Lcom/wordnet/dic/synonym/common/CommonVariable;->pref_FirstGrade:Ljava/lang/String;

    invoke-static {v9}, Lcom/wordnet/dic/synonym/common/CommonUtil;->getWordGradeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->getDicSynonymData(ILjava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 903
    :cond_8
    :goto_3
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<td>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 905
    if-eqz v0, :cond_c

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_c

    .line 909
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_4
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lt v4, v7, :cond_a

    .line 921
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 931
    .end local v4    # "i":I
    :goto_5
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "</td>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 932
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "</tr>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 934
    const-string v6, ""

    .line 936
    if-eqz v0, :cond_1

    .line 937
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    goto/16 :goto_1

    .line 898
    :cond_9
    const-string v7, "\ubc18"

    invoke-virtual {p2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 899
    iget-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "<td class=\'first\'>\ubc18\uc758\uc5b4</td>"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->strHtml:Ljava/lang/String;

    .line 900
    sget-object v7, Lcom/wordnet/dic/synonym/common/CommonVariable;->mDBHelper:Lcom/wordnet/dic/synonym/data/DatabaseHelper;

    invoke-virtual {v3}, Lcom/wordnet/dic/synonym/data/DataModels;->getIntId()I

    move-result v8

    sget-object v9, Lcom/wordnet/dic/synonym/common/CommonVariable;->pref_FirstGrade:Ljava/lang/String;

    invoke-static {v9}, Lcom/wordnet/dic/synonym/common/CommonUtil;->getWordGradeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->getDicAntonymData(ILjava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    goto/16 :goto_3

    .line 911
    .restart local v4    # "i":I
    :cond_a
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/wordnet/dic/synonym/data/DataModels;

    .line 913
    .local v1, "dmSecond":Lcom/wordnet/dic/synonym/data/DataModels;
    const-string v7, ""

    if-eq v6, v7, :cond_b

    .line 914
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, ", "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 917
    :cond_b
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "<a href=\'http://localhost|"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Lcom/wordnet/dic/synonym/data/DataModels;->getStrId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\' class=\'no_uline second\'>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 918
    invoke-virtual {v1}, Lcom/wordnet/dic/synonym/data/DataModels;->getStrPyojaeName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Lcom/wordnet/dic/synonym/data/DataModels;->getStrPyojaeNameEtc()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</a>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 917
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 909
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_4

    .line 925
    .end local v1    # "dmSecond":Lcom/wordnet/dic/synonym/data/DataModels;
    .end local v4    # "i":I
    :cond_c
    const-string v7, "\uc720"

    invoke-virtual {p2, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v7

    if-eqz v7, :cond_d

    .line 926
    const/4 v5, 0x1

    .line 927
    goto/16 :goto_5

    .line 928
    :cond_d
    const/4 v5, 0x2

    goto/16 :goto_5
.end method

.method private setResultWebViewTitle(ILjava/lang/String;)V
    .locals 4
    .param p1, "position"    # I
    .param p2, "strGubn"    # Ljava/lang/String;

    .prologue
    .line 795
    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 797
    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wordnet/dic/synonym/data/DataModels;

    .line 799
    .local v0, "historyDM":Lcom/wordnet/dic/synonym/data/DataModels;
    const/4 v1, 0x0

    sput-boolean v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->suggestList:Z

    .line 800
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->autoCompleteTextBox:Landroid/widget/EditText;

    invoke-virtual {v0}, Lcom/wordnet/dic/synonym/data/DataModels;->getStrPyojaeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 801
    const/4 v1, 0x1

    sput-boolean v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->suggestList:Z

    .line 803
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->detailPyojaeName:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/wordnet/dic/synonym/data/DataModels;->getStrPyojaeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 804
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->detailPyojaeNameEtc:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/wordnet/dic/synonym/data/DataModels;->getStrPyojaeNameEtc()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 806
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->detailMean:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/wordnet/dic/synonym/data/DataModels;->getStrMean()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 807
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->detailWordGrade:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/wordnet/dic/synonym/data/DataModels;->getIntWordGrade()I

    move-result v2

    invoke-static {v2}, Lcom/wordnet/dic/synonym/common/CommonUtil;->getWordGrade(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 809
    invoke-virtual {v0}, Lcom/wordnet/dic/synonym/data/DataModels;->getStrWordClass()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/wordnet/dic/synonym/data/DataModels;->getStrWordClass()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 810
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->detailWordClass:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u3010"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/wordnet/dic/synonym/data/DataModels;->getStrWordClass()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\u3011"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 815
    .end local v0    # "historyDM":Lcom/wordnet/dic/synonym/data/DataModels;
    :cond_0
    :goto_0
    return-void

    .line 812
    .restart local v0    # "historyDM":Lcom/wordnet/dic/synonym/data/DataModels;
    :cond_1
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->detailWordClass:Landroid/widget/TextView;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private setSearchHistory(Landroid/database/Cursor;)V
    .locals 2
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 1161
    if-eqz p1, :cond_0

    :try_start_0
    sget-object v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 1163
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 1165
    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->isAfterLast()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_2

    .line 1202
    :cond_0
    :goto_1
    if-eqz p1, :cond_1

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 1204
    :cond_1
    :goto_2
    return-void

    .line 1167
    :cond_2
    :try_start_1
    new-instance v0, Lcom/wordnet/dic/synonym/data/DataModels;

    invoke-direct {v0}, Lcom/wordnet/dic/synonym/data/DataModels;-><init>()V

    iput-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    .line 1169
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/wordnet/dic/synonym/data/DataModels;->setIntId(I)V

    .line 1170
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v1, 0x1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrPyojaeName(Ljava/lang/String;)V

    .line 1171
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v1, 0x2

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrPyojaeNameEtc(Ljava/lang/String;)V

    .line 1172
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v1, 0x3

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/wordnet/dic/synonym/data/DataModels;->setIntWordGrade(I)V

    .line 1173
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v1, 0x4

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrWordClass(Ljava/lang/String;)V

    .line 1174
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v1, 0x5

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrMean(Ljava/lang/String;)V

    .line 1175
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v1, 0x6

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrSynFlag(Ljava/lang/String;)V

    .line 1176
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    const/4 v1, 0x7

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrAntFlag(Ljava/lang/String;)V

    .line 1178
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    invoke-virtual {v0}, Lcom/wordnet/dic/synonym/data/DataModels;->getIsSubData()Ljava/lang/String;

    move-result-object v0

    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1179
    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getParent()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "\uc120\ud0dd\ud55c \ub2e8\uc5b4\uc758 \uc720\uc758\uc5b4 \ubc0f \ubc18\uc758\uc5b4\uac00 \uc874\uc7ac\ud558\uc9c0 \uc54a\uc2b5\ub2c8\ub2e4."

    invoke-static {v0, v1}, Lcom/wordnet/dic/synonym/common/CommonUtil;->showMessageBox(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 1199
    :catch_0
    move-exception v0

    .line 1202
    if-eqz p1, :cond_1

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    goto :goto_2

    .line 1183
    :cond_3
    :try_start_2
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    invoke-virtual {v0}, Lcom/wordnet/dic/synonym/data/DataModels;->getIsSubData()Ljava/lang/String;

    move-result-object v0

    const-string v1, "1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1184
    const-string v0, "\uc720"

    sput-object v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->curDic:Ljava/lang/String;

    .line 1189
    :goto_3
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->curDic:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrGubn(Ljava/lang/String;)V

    .line 1190
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->pref_SecondGrade:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrGrade(Ljava/lang/String;)V

    .line 1192
    const/4 v0, 0x1

    sput-boolean v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->historySave:Z

    .line 1193
    sget-object v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dm:Lcom/wordnet/dic/synonym/data/DataModels;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1194
    sget-object v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    sput v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->curStackLocation:I

    .line 1196
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0

    .line 1201
    :catchall_0
    move-exception v0

    .line 1202
    if-eqz p1, :cond_4

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 1203
    :cond_4
    throw v0

    .line 1186
    :cond_5
    :try_start_3
    const-string v0, "\ubc18"

    sput-object v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->curDic:Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_3
.end method


# virtual methods
.method public onBackPressed()V
    .locals 4

    .prologue
    const/4 v2, 0x1

    .line 1260
    const/4 v0, 0x0

    .line 1262
    .local v0, "returnValue":Z
    iget-boolean v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->downloadProgressShow:Z

    if-eqz v1, :cond_0

    .line 1263
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->callDicDatabase:Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$CallDicDatabase;

    invoke-virtual {v1, v2}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$CallDicDatabase;->cancel(Z)Z

    .line 1264
    const/4 v0, 0x1

    .line 1267
    :cond_0
    iget-boolean v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->searchProgressShow:Z

    if-eqz v1, :cond_1

    .line 1268
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->callSearchResultData:Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$CallSearchResultData;

    invoke-virtual {v1, v2}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$CallSearchResultData;->cancel(Z)Z

    .line 1269
    const/4 v0, 0x1

    .line 1272
    :cond_1
    if-eqz v0, :cond_2

    .line 1293
    :goto_0
    return-void

    .line 1274
    :cond_2
    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->curViewMode:Ljava/lang/String;

    const-string v2, "resultView"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1275
    const-string v1, "searchView"

    sput-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->curViewMode:Ljava/lang/String;

    .line 1276
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->setDisplay()V

    .line 1277
    iget-object v1, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->autoCompleteTextBox:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->autoCompleteTextBox:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 1279
    :cond_3
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->getParent()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1280
    const-string v2, "\ud504\ub85c\uadf8\ub7a8 \uc885\ub8cc"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 1281
    const-string v2, "\uc720\uc758\uc5b4 \uc0ac\uc804\uc744 \uc885\ub8cc\ud558\uc2dc\uaca0\uc2b5\ub2c8\uae4c?"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 1282
    const v2, 0x7f020015

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 1283
    const-string v2, "\uc608"

    new-instance v3, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$15;

    invoke-direct {v3, p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$15;-><init>(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 1290
    const-string v2, "\uc544\ub2c8\uc624"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 1291
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 89
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 90
    const v0, 0x7f030002

    invoke-virtual {p0, v0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->setContentView(I)V

    .line 92
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->initialize()V

    .line 93
    return-void
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 4
    .param p1, "id"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 433
    packed-switch p1, :pswitch_data_0

    .line 455
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 435
    :pswitch_0
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->downloadProgress:Landroid/app/ProgressDialog;

    .line 436
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->downloadProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 437
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->downloadProgress:Landroid/app/ProgressDialog;

    const-string v1, "\ud30c\uc77c \ub2e4\uc6b4\ub85c\ub4dc \uc911.."

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 438
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->downloadProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 439
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->downloadProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 440
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->downloadProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 442
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->downloadProgress:Landroid/app/ProgressDialog;

    new-instance v1, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$12;

    invoke-direct {v1, p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity$12;-><init>(Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;)V

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 450
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->downloadProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 452
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->downloadProgress:Landroid/app/ProgressDialog;

    goto :goto_0

    .line 433
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 286
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 288
    sget-object v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 289
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->searchHistory:Ljava/util/ArrayList;

    .line 292
    :cond_0
    sget-object v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->pref_FontSize:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 293
    iget-object v0, p0, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->webViewResult:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    sget-object v1, Lcom/wordnet/dic/synonym/common/CommonVariable;->pref_FontSize:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    mul-int/lit8 v1, v1, 0x2

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setDefaultFontSize(I)V

    .line 296
    :cond_1
    sget-boolean v0, Lcom/wordnet/dic/synonym/common/CommonVariable;->chkDB:Z

    if-nez v0, :cond_2

    invoke-direct {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->dbCheck()V

    .line 298
    :cond_2
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->setDisplayDesign()V

    .line 299
    invoke-direct {p0}, Lcom/wordnet/dic/synonym/DicSearch_Synonym_Activity;->setDisplay()V

    .line 300
    return-void
.end method
