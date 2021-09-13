import 'package:path/path.dart';
import 'package:restaurant/data/entity/restaurant_entity/restaurant_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:core';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;
  static const _dbName = "restaurant_db.db";
  static const _dbVersion = 1;
  static const _tableRestaurant = "restaurant";

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initDb();
    return _database;
  }

  Future<Database> _initDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, _dbName),
      onCreate: (db, version) async {
        await db.execute(
          '''
          CREATE TABLE $_tableRestaurant (
            id TEXT PRIMARY KEY,
            restaurantJson TEXT
          )
        ''',
        );
      },
      version: _dbVersion,
    );

    return db;
  }

  Future<bool> insertRestaurant(RestaurantEntity restaurant) async {
    (await database).insert(_tableRestaurant, restaurant.toJson());
    return true;
  }

  Future<bool> deleteRestaurant(String id) async {
    (await database).delete(_tableRestaurant, where: 'id = ?', whereArgs: [id]);
    return true;
  }

  Future<List<RestaurantEntity>> getRestaurantsLocal() async {
    final db = await database;
    List<Map<String, Object?>> res = await db.query(_tableRestaurant);
    return res.map((e) => RestaurantEntity.fromJson(e)).toList();
  }

  Future<bool> isRestaurantExist(String id) async {
    final db = await database;
    List<Map<String, Object?>> res = await db.query(
      _tableRestaurant,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (res.isEmpty) return false;
    
    return true;
  }
}
