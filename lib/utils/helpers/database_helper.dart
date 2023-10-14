import 'dart:async';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const databaseName = 'data.db';
  static const databaseVersion = 1;

  static Database? _database;

  static FutureOr<Database> get database async {
    if (_database != null) return _database!;

    _database = await openDatabase(databaseName, version: databaseVersion,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          gender TEXT NOT NULL,
          phone TEXT NOT NULL,
          email TEXT NOT NULL,
          birthday TEXT NOT NULL,
          picture TEXT NOT NULL,
          street TEXT NOT NULL,
          city TEXT NOT NULL,
          state TEXT NOT NULL,
          country TEXT NOT NULL,
          favorite BOOLEAN NOT NULL
        )
      ''');
    });

    return _database!;
  }

  Future<int> insert(String table, Map<String, dynamic> values) async {
    final Database db = await database;
    return await db.insert(table, values);
  }

  Future<List<Map<String, dynamic>>> query(String table,
      {String? where,
      List<dynamic>? whereArgs,
      String? orderBy,
      int? limit}) async {
    final Database db = await database;

    return await db.query(table,
        where: where, whereArgs: whereArgs, orderBy: orderBy, limit: limit);
  }

  Future<int> update(String table, Map<String, dynamic> values,
      {String? where, List<dynamic>? whereArgs}) async {
    final Database db = await database;

    return await db.update(table, values, where: where, whereArgs: whereArgs);
  }

  Future<int> delete(String table,
      {String? where, List<dynamic>? whereArgs}) async {
    final Database db = await database;

    return await db.delete(table, where: where, whereArgs: whereArgs);
  }

  Future<void> close() async {
    final Database db = await database;

    return await db.close();
  }

  Future<void> execute(String sql) async {
    final Database db = await database;

    return await db.execute(sql);
  }

  Future<void> run() async {
    _database = await openDatabase(databaseName, version: databaseVersion,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          gender TEXT NOT NULL,
          phone TEXT NOT NULL,
          email TEXT NOT NULL,
          birthday TEXT NOT NULL,
          picture TEXT NOT NULL,
          street TEXT NOT NULL,
          city TEXT NOT NULL,
          state TEXT NOT NULL,
          country TEXT NOT NULL,
          favorite INTEGER NOT NULL
        )
      ''');
    });
  }
}
