import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  static Future<Database> initDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'ziarah.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE ziarah(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT
          )
        ''');
      },
    );
  }

  static Future<int> insertNama(String nama) async {
    final db = await database;
    return db.insert('ziarah', {'nama': nama});
  }

  static Future<Map<String, dynamic>> getLastData() async {
    final db = await database;
    final res = await db.query('ziarah', orderBy: 'id DESC', limit: 1);
    return res.first;
  }

  static Future<void> deleteAll() async {
    final db = await database;
    await db.delete('ziarah');
  }
}
