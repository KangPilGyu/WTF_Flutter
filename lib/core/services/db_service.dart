import 'package:sqflite/sqflite.dart';
import 'package:wtf_main/core/models/user.dart';
import 'package:wtf_main/db/sqflite.dart';

class DBService {
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  createUser(User user) async {
    final db = await database;
    var result = await db.rawInsert('''
      INSERT INTO users(name) values (?)
    ''', [user.name]);
    return result;
  }

  getUser(int userId) async {
    final db = await database;
    var result = await db.rawQuery('''
      SELECT * FROM users where id = (?)
    ''', [userId]);
    return result.isNotEmpty ? User(id: result.first['id'], name: result.first['name']) : Null;
  }
}