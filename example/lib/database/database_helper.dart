import 'package:path/path.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
          CREATE TABLE audio (
            id TEXT NOT NULL,
            data TEXT NOT NULL
          )
          ''');
  }

  Future<int?> create(Map<String, dynamic> note) async {
    final db = await instance.database;
    try {
      final id = await db.insert('audio', note);
      return id;
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>> readNote(String id) async {
    final db = await instance.database;

    final maps = await db.query(
      'audio',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return maps.first;
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
