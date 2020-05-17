import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

initDB() async {
  Directory documentDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentDirectory.path, 'MyDB.db');

  return await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE users(
          id INTEGER PRIMARY KEY,
          name TEXT
         )
         ''');
    },
    onUpgrade: (db, oldVersion, newVersion){}
  );
}
