import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/event_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('events.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE events (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      startTime TEXT NOT NULL,
      endTime TEXT NOT NULL,
      colorCode TEXT NOT NULL
    )
    ''');
  }

  Future<void> insertEvent(EventModel event) async {
    final db = await instance.database;
    await db.insert('events', event.toMap());
  }

  Future<List<EventModel>> getEvents() async {
    final db = await instance.database;
    final result = await db.query('events');

    return result.map((json) => EventModel.fromMap(json)).toList();
  }

  Future<void> deleteEvent(int id) async {
    final db = await instance.database;
    await db.delete('events', where: 'id = ?', whereArgs: [id]);
  }
}
