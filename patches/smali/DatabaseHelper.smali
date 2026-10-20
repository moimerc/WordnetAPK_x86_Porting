.class public Lcom/wordnet/dic/synonym/data/DatabaseHelper;
.super Lnet/sqlcipher/database/SQLiteOpenHelper;
.source "DatabaseHelper.java"


# static fields
.field private static final CLASSNAME:Ljava/lang/String;

.field private static final DBPW:Ljava/lang/String; = "papa@leave3463"

.field private static db:Lnet/sqlcipher/database/SQLiteDatabase;

.field private static mDBHelper:Lcom/wordnet/dic/synonym/data/DatabaseHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const-class v0, Lcom/wordnet/dic/synonym/data/DatabaseHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->CLASSNAME:Ljava/lang/String;

    .line 24
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 32
    const-string v0, ".dicPyojaeEnc20140812.db"

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, p1, v0, v1, v2}, Lnet/sqlcipher/database/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Lnet/sqlcipher/database/SQLiteDatabase$CursorFactory;I)V

    .line 33
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;Lnet/sqlcipher/database/SQLiteDatabase$CursorFactory;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "factory"    # Lnet/sqlcipher/database/SQLiteDatabase$CursorFactory;
    .param p4, "version"    # I

    .prologue
    .line 28
    invoke-direct {p0, p1, p2, p3, p4}, Lnet/sqlcipher/database/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Lnet/sqlcipher/database/SQLiteDatabase$CursorFactory;I)V

    .line 29
    return-void
.end method

.method private static checkDB()Z
    .locals 5

    .prologue
    .line 69
    const/4 v2, 0x0

    .line 71
    .local v2, "result":Z
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    .line 72
    .local v0, "SDCard":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "wordnet"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".dicPyojaeEnc20140812.db"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 74
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x1

    .line 76
    :cond_0
    return v2
.end method

.method public static final getInstance(Landroid/content/Context;)Lcom/wordnet/dic/synonym/data/DatabaseHelper;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 57
    invoke-static {p0}, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->initialize(Landroid/content/Context;)V

    .line 58
    sget-object v0, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->mDBHelper:Lcom/wordnet/dic/synonym/data/DatabaseHelper;

    return-object v0
.end method

.method private static initialize(Landroid/content/Context;)V
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    invoke-static {p0}, Lnet/sqlcipher/database/SQLiteDatabase;->loadLibs(Landroid/content/Context;)V

    .line 39
    const/4 v2, 0x0

    .line 41
    .local v2, "strDBLocation":Ljava/lang/String;
    sget-object v3, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->mDBHelper:Lcom/wordnet/dic/synonym/data/DatabaseHelper;

    if-nez v3, :cond_0

    .line 42
    new-instance v3, Lcom/wordnet/dic/synonym/data/DatabaseHelper;

    invoke-direct {v3, p0}, Lcom/wordnet/dic/synonym/data/DatabaseHelper;-><init>(Landroid/content/Context;)V

    sput-object v3, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->mDBHelper:Lcom/wordnet/dic/synonym/data/DatabaseHelper;

    .line 45
    :try_start_0
    invoke-static {}, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->checkDB()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 46
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    .line 47
    .local v0, "SDCard":Ljava/io/File;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "wordnet"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".dicPyojaeEnc20140812.db"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 48
    const-string v3, "papa@leave3463"

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Lnet/sqlcipher/database/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;Ljava/lang/String;Lnet/sqlcipher/database/SQLiteDatabase$CursorFactory;)Lnet/sqlcipher/database/SQLiteDatabase;

    move-result-object v3

    sput-object v3, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->db:Lnet/sqlcipher/database/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .end local v0    # "SDCard":Ljava/io/File;
    :cond_0
    :goto_0
    return-void

    .line 50
    :catch_0
    move-exception v1

    .line 51
    .local v1, "se":Ljava/lang/Exception;
    const-string v3, "DIC_SYNONYM"

    sget-object v4, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->CLASSNAME:Ljava/lang/String;

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 62
    sget-object v0, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->mDBHelper:Lcom/wordnet/dic/synonym/data/DatabaseHelper;

    if-eqz v0, :cond_0

    .line 63
    sget-object v0, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->db:Lnet/sqlcipher/database/SQLiteDatabase;

    invoke-virtual {v0}, Lnet/sqlcipher/database/SQLiteDatabase;->close()V

    .line 64
    const/4 v0, 0x0

    sput-object v0, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->mDBHelper:Lcom/wordnet/dic/synonym/data/DatabaseHelper;

    .line 66
    :cond_0
    return-void
.end method

.method public getAutoCompleteData(Ljava/lang/String;)Lnet/sqlcipher/Cursor;
    .locals 8
    .param p1, "strWord"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/sqlcipher/SQLException;
        }
    .end annotation

    .prologue
    const v7, 0xd7a3

    .line 89
    const-string v3, "SELECT _id, \t \t pyojae_name,\t\t COALESCE(pyojae_name_etc,\'\'),       REPLACE(word_grade,\'0\',\'\'),       COALESCE(word_class,\'\'),\t\t COALESCE(mean,\'\'),       syn_flag, ant_flag\tFROM pyojae WHERE (SELECT _id\t\t    FROM pyojae INDEXED BY idx_pyojae_name  \t   WHERE pyojae_name >= ? AND pyojae_name < ?) + 30 > _id\t AND (SELECT _id \t        FROM pyojae INDEXED BY idx_pyojae_name \t       WHERE pyojae_name >= ? AND pyojae_name < ?) <= _id"

    .line 104
    .local v3, "queryString":Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 105
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 108
    :cond_0
    const/4 v4, 0x4

    new-array v2, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p1, v2, v4

    const/4 v4, 0x1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    const/4 v4, 0x2

    aput-object p1, v2, v4

    const/4 v4, 0x3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    .line 112
    .local v2, "params":[Ljava/lang/String;
    :try_start_0
    sget-object v4, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->db:Lnet/sqlcipher/database/SQLiteDatabase;

    invoke-virtual {v4, v3, v2}, Lnet/sqlcipher/database/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Lnet/sqlcipher/Cursor;
    :try_end_0
    .catch Lnet/sqlcipher/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 114
    .local v0, "cursor":Lnet/sqlcipher/Cursor;
    if-eqz v0, :cond_1

    .line 122
    .end local v0    # "cursor":Lnet/sqlcipher/Cursor;
    :goto_0
    return-object v0

    .line 117
    :catch_0
    move-exception v1

    .line 118
    .local v1, "e":Lnet/sqlcipher/SQLException;
    const-string v4, "getAutoCompleteData"

    invoke-virtual {v1}, Lnet/sqlcipher/SQLException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    throw v1

    .line 122
    .end local v1    # "e":Lnet/sqlcipher/SQLException;
    .restart local v0    # "cursor":Lnet/sqlcipher/Cursor;
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getDicAntonymData(ILjava/lang/String;)Ljava/util/ArrayList;
    .locals 8
    .param p1, "id"    # I
    .param p2, "strGrade"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/wordnet/dic/synonym/data/DataModels;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/sqlcipher/SQLException;
        }
    .end annotation

    .prologue
    .line 258
    const/4 v1, 0x0

    .line 261
    .local v1, "cursor":Lnet/sqlcipher/Cursor;
    const-string v4, "SELECT p._id, \t\t COALESCE(p.pyojae_name,\'\'),        COALESCE(p.pyojae_name_etc,\'\')   FROM pyojae_ant a INDEXED BY idx_pyojae_ant_p_no  LEFT OUTER JOIN pyojae p on a.p_no2 = p._id WHERE a.p_no = ?"

    .line 270
    .local v4, "queryString":Ljava/lang/String;
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 272
    .local v0, "arrResult":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/wordnet/dic/synonym/data/DataModels;>;"
    if-eqz p2, :cond_0

    const-string v6, ""

    invoke-virtual {p2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 273
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "   AND p.word_grade in ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 276
    :cond_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, " ORDER BY replace(p.word_grade, 0 , 9), p.pyojae_name ASC"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 278
    const/4 v6, 0x1

    new-array v3, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v6

    .line 280
    .local v3, "params":[Ljava/lang/String;
    sget-object v6, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->db:Lnet/sqlcipher/database/SQLiteDatabase;

    invoke-virtual {v6, v4, v3}, Lnet/sqlcipher/database/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Lnet/sqlcipher/Cursor;

    move-result-object v1

    .line 282
    if-eqz v1, :cond_1

    invoke-interface {v1}, Lnet/sqlcipher/Cursor;->getCount()I

    move-result v6

    if-lez v6, :cond_1

    .line 284
    invoke-interface {v1}, Lnet/sqlcipher/Cursor;->moveToFirst()Z

    .line 288
    :goto_0
    invoke-interface {v1}, Lnet/sqlcipher/Cursor;->isAfterLast()Z
    :try_end_0
    .catch Lnet/sqlcipher/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v6

    if-eqz v6, :cond_3

    .line 304
    :cond_1
    if-eqz v1, :cond_2

    invoke-interface {v1}, Lnet/sqlcipher/Cursor;->close()V

    .line 307
    :cond_2
    return-object v0

    .line 289
    :cond_3
    :try_start_1
    new-instance v5, Lcom/wordnet/dic/synonym/data/DataModels;

    invoke-direct {v5}, Lcom/wordnet/dic/synonym/data/DataModels;-><init>()V

    .line 291
    .local v5, "row":Lcom/wordnet/dic/synonym/data/DataModels;
    const/4 v6, 0x0

    invoke-interface {v1, v6}, Lnet/sqlcipher/Cursor;->getInt(I)I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/wordnet/dic/synonym/data/DataModels;->setIntId(I)V

    .line 292
    const/4 v6, 0x1

    invoke-interface {v1, v6}, Lnet/sqlcipher/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrPyojaeName(Ljava/lang/String;)V

    .line 293
    const/4 v6, 0x2

    invoke-interface {v1, v6}, Lnet/sqlcipher/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrPyojaeNameEtc(Ljava/lang/String;)V

    .line 295
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 297
    invoke-interface {v1}, Lnet/sqlcipher/Cursor;->moveToNext()Z
    :try_end_1
    .catch Lnet/sqlcipher/SQLException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 300
    .end local v0    # "arrResult":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/wordnet/dic/synonym/data/DataModels;>;"
    .end local v3    # "params":[Ljava/lang/String;
    .end local v5    # "row":Lcom/wordnet/dic/synonym/data/DataModels;
    :catch_0
    move-exception v2

    .line 301
    .local v2, "e":Lnet/sqlcipher/SQLException;
    :try_start_2
    const-string v6, "getDicAntonymData"

    invoke-virtual {v2}, Lnet/sqlcipher/SQLException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 302
    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 303
    .end local v2    # "e":Lnet/sqlcipher/SQLException;
    :catchall_0
    move-exception v6

    .line 304
    if-eqz v1, :cond_4

    invoke-interface {v1}, Lnet/sqlcipher/Cursor;->close()V

    .line 305
    :cond_4
    throw v6
.end method

.method public getDicSynonymData(ILjava/lang/String;)Ljava/util/ArrayList;
    .locals 8
    .param p1, "id"    # I
    .param p2, "strGrade"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/wordnet/dic/synonym/data/DataModels;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/sqlcipher/SQLException;
        }
    .end annotation

    .prologue
    .line 204
    const/4 v1, 0x0

    .line 207
    .local v1, "cursor":Lnet/sqlcipher/Cursor;
    const-string v4, "SELECT p._id, \t\t COALESCE(p.pyojae_name,\'\'),        COALESCE(p.pyojae_name_etc,\'\')   FROM pyojae_syn s INDEXED BY idx_pyojae_syn_p_no  LEFT OUTER JOIN pyojae p on s.p_no2 = p._id WHERE s.p_no = ?"

    .line 216
    .local v4, "queryString":Ljava/lang/String;
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 218
    .local v0, "arrResult":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/wordnet/dic/synonym/data/DataModels;>;"
    if-eqz p2, :cond_0

    const-string v6, ""

    invoke-virtual {p2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 219
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "   AND p.word_grade in ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 222
    :cond_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, " ORDER BY replace(p.word_grade, 0 , 9), p.pyojae_name ASC"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 224
    const/4 v6, 0x1

    new-array v3, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v6

    .line 226
    .local v3, "params":[Ljava/lang/String;
    sget-object v6, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->db:Lnet/sqlcipher/database/SQLiteDatabase;

    invoke-virtual {v6, v4, v3}, Lnet/sqlcipher/database/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Lnet/sqlcipher/Cursor;

    move-result-object v1

    .line 228
    if-eqz v1, :cond_1

    invoke-interface {v1}, Lnet/sqlcipher/Cursor;->getCount()I

    move-result v6

    if-lez v6, :cond_1

    .line 230
    invoke-interface {v1}, Lnet/sqlcipher/Cursor;->moveToFirst()Z

    .line 234
    :goto_0
    invoke-interface {v1}, Lnet/sqlcipher/Cursor;->isAfterLast()Z
    :try_end_0
    .catch Lnet/sqlcipher/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v6

    if-eqz v6, :cond_3

    .line 250
    :cond_1
    if-eqz v1, :cond_2

    invoke-interface {v1}, Lnet/sqlcipher/Cursor;->close()V

    .line 253
    :cond_2
    return-object v0

    .line 235
    :cond_3
    :try_start_1
    new-instance v5, Lcom/wordnet/dic/synonym/data/DataModels;

    invoke-direct {v5}, Lcom/wordnet/dic/synonym/data/DataModels;-><init>()V

    .line 237
    .local v5, "row":Lcom/wordnet/dic/synonym/data/DataModels;
    const/4 v6, 0x0

    invoke-interface {v1, v6}, Lnet/sqlcipher/Cursor;->getInt(I)I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/wordnet/dic/synonym/data/DataModels;->setIntId(I)V

    .line 238
    const/4 v6, 0x1

    invoke-interface {v1, v6}, Lnet/sqlcipher/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrPyojaeName(Ljava/lang/String;)V

    .line 239
    const/4 v6, 0x2

    invoke-interface {v1, v6}, Lnet/sqlcipher/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/wordnet/dic/synonym/data/DataModels;->setStrPyojaeNameEtc(Ljava/lang/String;)V

    .line 241
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 243
    invoke-interface {v1}, Lnet/sqlcipher/Cursor;->moveToNext()Z
    :try_end_1
    .catch Lnet/sqlcipher/SQLException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 246
    .end local v0    # "arrResult":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/wordnet/dic/synonym/data/DataModels;>;"
    .end local v3    # "params":[Ljava/lang/String;
    .end local v5    # "row":Lcom/wordnet/dic/synonym/data/DataModels;
    :catch_0
    move-exception v2

    .line 247
    .local v2, "e":Lnet/sqlcipher/SQLException;
    :try_start_2
    const-string v6, "getDicSynonymData"

    invoke-virtual {v2}, Lnet/sqlcipher/SQLException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 249
    .end local v2    # "e":Lnet/sqlcipher/SQLException;
    :catchall_0
    move-exception v6

    .line 250
    if-eqz v1, :cond_4

    invoke-interface {v1}, Lnet/sqlcipher/Cursor;->close()V

    .line 251
    :cond_4
    throw v6
.end method

.method public getNextAutoCompleteData(Ljava/lang/String;)Lnet/sqlcipher/Cursor;
    .locals 6
    .param p1, "strId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/sqlcipher/SQLException;
        }
    .end annotation

    .prologue
    .line 127
    const-string v3, "SELECT _id, \t \t pyojae_name,\t\t COALESCE(pyojae_name_etc,\'\'),       REPLACE(word_grade,\'0\',\'\'),       COALESCE(word_class,\'\'),\t\t COALESCE(mean,\'\'),       syn_flag, ant_flag  FROM pyojae WHERE (SELECT _id          FROM pyojae          WHERE _id = ? limit 1) + 30 > _id   AND (SELECT _id          FROM pyojae      \t   WHERE _id = ? limit 1) < _id  ORDER BY pyojae_name"

    .line 143
    .local v3, "queryString":Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 144
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 147
    :cond_0
    const/4 v4, 0x2

    new-array v2, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p1, v2, v4

    const/4 v4, 0x1

    aput-object p1, v2, v4

    .line 149
    .local v2, "params":[Ljava/lang/String;
    if-nez p1, :cond_1

    .line 150
    const/4 v2, 0x0

    .line 155
    :cond_1
    :try_start_0
    sget-object v4, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->db:Lnet/sqlcipher/database/SQLiteDatabase;

    invoke-virtual {v4, v3, v2}, Lnet/sqlcipher/database/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Lnet/sqlcipher/Cursor;
    :try_end_0
    .catch Lnet/sqlcipher/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 157
    .local v0, "cursor":Lnet/sqlcipher/Cursor;
    if-eqz v0, :cond_2

    .line 165
    .end local v0    # "cursor":Lnet/sqlcipher/Cursor;
    :goto_0
    return-object v0

    .line 160
    :catch_0
    move-exception v1

    .line 161
    .local v1, "e":Lnet/sqlcipher/SQLException;
    const-string v4, "getNextAutoCompleteData"

    invoke-virtual {v1}, Lnet/sqlcipher/SQLException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    throw v1

    .line 165
    .end local v1    # "e":Lnet/sqlcipher/SQLException;
    .restart local v0    # "cursor":Lnet/sqlcipher/Cursor;
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getPyojaeData(Ljava/lang/String;)Lnet/sqlcipher/Cursor;
    .locals 6
    .param p1, "strId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/sqlcipher/SQLException;
        }
    .end annotation

    .prologue
    .line 170
    const-string v3, "SELECT _id, \t \t pyojae_name,\t\t COALESCE(pyojae_name_etc,\'\'),       REPLACE(word_grade,\'0\',\'\'),       COALESCE(word_class,\'\'),\t\t COALESCE(mean,\'\'),       syn_flag, ant_flag  FROM pyojae  WHERE _id = ?"

    .line 181
    .local v3, "queryString":Ljava/lang/String;
    const/4 v4, 0x1

    new-array v2, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p1, v2, v4

    .line 183
    .local v2, "params":[Ljava/lang/String;
    if-nez p1, :cond_0

    .line 184
    const/4 v2, 0x0

    .line 189
    :cond_0
    :try_start_0
    sget-object v4, Lcom/wordnet/dic/synonym/data/DatabaseHelper;->db:Lnet/sqlcipher/database/SQLiteDatabase;

    invoke-virtual {v4, v3, v2}, Lnet/sqlcipher/database/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Lnet/sqlcipher/Cursor;
    :try_end_0
    .catch Lnet/sqlcipher/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 191
    .local v0, "cursor":Lnet/sqlcipher/Cursor;
    if-eqz v0, :cond_1

    .line 199
    .end local v0    # "cursor":Lnet/sqlcipher/Cursor;
    :goto_0
    return-object v0

    .line 194
    :catch_0
    move-exception v1

    .line 195
    .local v1, "e":Lnet/sqlcipher/SQLException;
    const-string v4, "getPyojaeData"

    invoke-virtual {v1}, Lnet/sqlcipher/SQLException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    throw v1

    .line 199
    .end local v1    # "e":Lnet/sqlcipher/SQLException;
    .restart local v0    # "cursor":Lnet/sqlcipher/Cursor;
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCreate(Lnet/sqlcipher/database/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Lnet/sqlcipher/database/SQLiteDatabase;

    .prologue
    .line 82
    return-void
.end method

.method public onUpgrade(Lnet/sqlcipher/database/SQLiteDatabase;II)V
    .locals 0
    .param p1, "db"    # Lnet/sqlcipher/database/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 85
    return-void
.end method
