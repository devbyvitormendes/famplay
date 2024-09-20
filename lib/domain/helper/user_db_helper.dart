import 'dart:async';

import 'package:famplay/domain/model/user/user_fields.dart';
import 'package:famplay/domain/model/user/user_model.dart';
import 'package:sqflite/sqflite.dart';

class UserDatabaseHelper {
  static final UserDatabaseHelper instance = UserDatabaseHelper._internal();
  static Database? _database;

  UserDatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/notes.db';
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    return await db.execute(
      '''CREATE TABLE ${UserFields.userTable} (
        ${UserFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${UserFields.name} TEXT NOT NULL,
        ${UserFields.email} TEXT NOT NULL,
        ${UserFields.password} TEXT NOT NULL,
        ${UserFields.image} TEXT NOT NULL,
        ${UserFields.profile} TEXT NOT NULL,
        ${UserFields.parentId} INTEGER
      )''',
    );
  }

  Future<UserModel> createParent(UserModel user) async {
    final db = await instance.database;
    user.setParentProfile();
    final id = await db.insert(UserFields.userTable, user.toJson());
    return user.copy(id: id);
  }

  Future<UserModel> createChild(UserModel user, int parentId) async {
    final db = await instance.database;
    user.setChildProfile(parentId);
    final id = await db.insert(UserFields.userTable, user.toJson());
    return user.copy(id: id);
  }

  Future<UserModel> read(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      UserFields.userTable,
      columns: UserFields.values,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return UserModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<UserModel>> getChildren(int parentId) async {
    final db = await instance.database;
    final maps = await db.query(
      UserFields.userTable,
      columns: UserFields.values,
      where: '${UserFields.parentId} = ?',
      whereArgs: [parentId],
    );

    if (maps.isNotEmpty) {
      return fromJsonList(maps);
    } else {
      throw Exception('Children not found');
    }
  }

  Future<int> update(UserModel user) async {
    final db = await instance.database;
    return db.update(
      UserFields.userTable,
      user.toJson(),
      where: '${UserFields.id} = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      UserFields.userTable,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
