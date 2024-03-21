import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SQLHelper {
  static const _dbName = 'task_db ';
  static const _dbVersion = 1;
  static const _tableName = 'tasks';

  static get tableName => _tableName;

  SQLHelper._();

  static final SQLHelper instance = SQLHelper._();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  //Initialising database
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  //Creating table in the db
  _onCreate(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE $_tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description VARCHAR(255),
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      ''',
    );
  }
}
