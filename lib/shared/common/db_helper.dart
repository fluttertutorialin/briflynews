import 'dart:async';
import 'dart:io' as io;
import '../../model/read_bookmark_db.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database? _database;
  static const String COLUMN_ID = 'unique_id';
  static const String COLUMN_USER_ID = 'user_id';
  static const String COLUMN_POST_ID = 'post_id';
  static const String COLUMN_CATEGORY_ID = 'category_id';
  static const String COLUMN_TOTAL_READ_VIEW = 'total_read_view';
  static const String COLUMN_IS_BOOKMARK = 'is_book_mark';
  static const String COLUMN_IS_READ = 'is_read';

  static const String TABLE = 'briflynews';
  static const String DB_NAME = 'briflynews.db';

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDb();
    return _database;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $TABLE ($COLUMN_ID TEXT PRIMARY KEY, $COLUMN_USER_ID TEXT, $COLUMN_POST_ID TEXT, $COLUMN_CATEGORY_ID TEXT, $COLUMN_TOTAL_READ_VIEW INTEGER, $COLUMN_IS_BOOKMARK INTEGER, $COLUMN_IS_READ INTEGER)');
  }

  Future<int> insert({required ReadBookMarkDb readBookMarkDb}) async {
    var dbClient = await database;
    var result = await dbClient!.insert(TABLE, readBookMarkDb.toMap());
    return result;
  }

  Future<ReadBookMarkDb?> isInsert({required String postId}) async {
    var dbClient = await database;

    var results = await dbClient!
        .rawQuery('SELECT * FROM $TABLE WHERE $COLUMN_POST_ID=?', [postId]);

    if (results.length > 0) {
      return ReadBookMarkDb.fromMap(results.first);
    }
    return null;
  }

  Future<int> bookMarkUpdate(
      {required String uniqueId,
      required ReadBookMarkDb readBookMarkDb}) async {
    // returns the number of rows updated
    var dbClient = await database;
    int result = await dbClient!.update("$TABLE", readBookMarkDb.toMap(),
        where: "unique_id = ?", whereArgs: [uniqueId]);
    return result;
  }

  Future<List<ReadBookMarkDb>> getAll() async {
    var dbClient = await database;

    List results = await dbClient!.query(TABLE);
    List<ReadBookMarkDb> readBookMarkList = [];
    results.forEach((map) {
      readBookMarkList.add(ReadBookMarkDb.fromMap(map));
    });
    print(readBookMarkList.length);
    return readBookMarkList;
  }

  Future<int> deleteUsers(String id) async {
    var dbClient = await database;
    int res = await dbClient!
        .rawDelete('DELETE FROM $TABLE WHERE $COLUMN_ID = ?', [id]);
    return res;
  }

  Future close() async {
    var dbClient = await database;
    dbClient!.close();
  }
}
