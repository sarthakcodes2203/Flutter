import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Dbase {
  static final Dbase instance = Dbase._init();
  static Dbase? _database;
  String version = '';
  String imeinumber = '';
  String classname = 'Dbase';

  Dbase._init();

  factory Dbase() {
    return instance;
  }

  Future<Database> get database async => _database ??= await initDB();

  ///DB Declare
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // String path = join(documentsDirectory.path, "");
    String path = documentsDirectory.path;
    var db = await openDatabase(path, version: 1, onOpen: (db) {
      if (kDebugMode) {
        print("Dbase - initDB - db opened");
      }
    }, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;
  }

  _onCreate(Database db, int version) async {
    try {
      await db.execute(
          "Create Table TBL_ERROR_LOG(_id integer primary key autoincrement,ERR_PAGE_NAME varchar,"
          "ERR_FUNCTION varchar,ERR_MESSAGE varchar,ERR_CAUSE varchar,"
          "ERR_FLAG varchar DEFAULT NO,ERR_STACKTRACE varchar,"
          "CRON DATE DEFAULT (datetime('now','localtime')),ERR_URL_REQUESTPAR varchar)");
      if (kDebugMode) {
        print("Dbase - _onCreate - Successfully db created");
      }
    } catch (ex) {
      if (kDebugMode) {
        print('Dbase - _onCreate - Error - $ex');
      }
    }
  }

  _onUpgrade(db, oldVersion, newVersion) async {
    var batch = db.batch();
    int upgradeTo = oldVersion + 1;
    try {
      while (upgradeTo <= newVersion) {
        switch (upgradeTo) {
          case 2:
            //add the code here
            break;
        }
      }
      await batch.commit();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<int> insert_sql(Map<String, dynamic> data, String tablename) async {
    try {
      final db = await database;
      return await db.insert(tablename, data);
    } catch (ex) {
      // Constants.logerror(
      //     classname, 'insert_sql', ex.toString(), '', version, imeinumber);
      return 0;
    }
  }

  Future<int> rawinsert_sql(String sql) async {
    try {
      final db = await database;
      return await db.rawInsert(sql);
    } catch (ex) {
      return 0;
    }
  }

  Future<Object> getArrayByQuery(String query) async {
    List<String> testarray = <String>[];
    try {
      final db = await database;
      List<Map> results = await db.rawQuery(query);

      for (var element in results) {
        debugPrint('${element.values.first}');
        testarray.add(element.values.first.toString());
      }
      return testarray;
    } catch (e) {
      // Constants.logerror(
      //     classname, 'rawQuery_sql', e.toString(), '', version, imeinumber);
      return 0;
    }
  }

  Future<List<Map<String, dynamic>>> getListByQuery(String query) async {
    List<Map<String, dynamic>> results = [];
    try {
      final db = await database;
      results = await db.query(query);
      return results;
    } catch (e) {
      // Constants.logerror(
      //     classname, 'rawQuery_sql', e.toString(), '', version, imeinumber);
      return results;
    }
  }
}

