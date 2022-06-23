import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


class SQLiteInit {
  SQLiteInit._();

  static SQLiteInit? _instance;

  static SQLiteInit get instance {
    _instance ??= SQLiteInit._();
    return _instance!;
  }

  static const databaseName = 'Nadeem.db';
  static const databaseVersion = 1;
  Database? _db;

  Future<Database> get db => _initDatabase();

  Future<Database> _initDatabase() async {
    sqfliteFfiInit();
    String databasePath = await databaseFactoryFfi.getDatabasesPath();
    String path = join(databasePath, databaseName);
    DatabaseFactory databaseFactory = databaseFactoryFfi;

     return _db??= await databaseFactory.openDatabase(path,
          options: OpenDatabaseOptions(
              onCreate: _onCreate, version: databaseVersion));

  }

  FutureOr<void> _onCreate(Database db, int version) async{
    await db.execute('''
      CREATE TABLE wares(
          id INTEGER PRIMARY KEY,
          wareName TEXT,
          wareAmount INTEGER,
          wareType TEXT,
          inOut TEXT,
          wareDate TEXT,
          notes TEXT
      )
      ''');
  }
}