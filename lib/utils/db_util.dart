// ignore_for_file: unused_label

import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbUtil {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    onCreate:
    (db, version) {
      return db.execute(
          'CREATE TABLE condutores (id TEXT PRIMARY KEY, nome TEXT, email TEXT, telefone Text )');
    };
    onCreate:
    (db, version) {
      return db.execute(
          'CREATE TABLE controles (id TEXT PRIMARY KEY, title TEXT, condutor TEXT, image TEXT, latitude REAL, longitude REAL, address TEXT)');
    };
    onCreate:
    (db, version) {
      return db.execute(
          'CREATE TABLE veiculos (id TEXT PRIMARY KEY, modelo TEXT, marca TEXT, placa TEXT )');
    };

    return sql.openDatabase(
      path.join(dbPath, 'controles.db'),
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbUtil.database();
    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbUtil.database();
    return db.query(table);
  }
}
