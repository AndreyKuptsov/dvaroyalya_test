// import 'package:sqflite/sqflite.dart';
// import 'package:dvaroyalya_test/models/event_model.dart';

// class DatabaseService {
//   final Database db;

//   DatabaseService(this.db);

//   Future<void> insertEvent(EventModel event) async {
//     await db.insert('events', event.toMap());
//   }

//   Future<List<EventModel>> getEvents() async {
//     final List<Map<String, dynamic>> result = await db.query('events');
//     return result.map((json) => EventModel.fromMap(json)).toList();
//   }
// }



// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import '../models/event_model.dart';

// class DatabaseService {
//   static final DatabaseService _instance = DatabaseService._();
//   static Database? _database;

//   DatabaseService._();

//   factory DatabaseService() => _instance;

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     final dbPath = await getDatabasesPath();
//     return openDatabase(
//       join(dbPath, 'events.db'),
//       onCreate: (db, version) {
//         return db.execute(
//           'CREATE TABLE events(id INTEGER PRIMARY KEY, title TEXT, startTime TEXT, endTime TEXT, colorCode TEXT)',
//         );
//       },
//       version: 1,
//     );
//   }

//   Future<void> insertEvent(EventModel event) async {
//     final db = await database;
//     await db.insert('events', event.toMap());
//   }

//   Future<List<EventModel>> getEvents() async {
//     final db = await database;
//     final List<Map<String, dynamic>> result = await db.query('events');
//     return result.map((json) => EventModel.fromMap(json)).toList();
//   }
// }
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/event_model.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'events.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE events(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, startTime TEXT, endTime TEXT, colorCode TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertEvent(EventModel event) async {
    final db = await database;
    await db.insert(
      'events',
      event.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<EventModel>> getEvents() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('events');

    return List.generate(maps.length, (i) {
      return EventModel.fromMap(maps[i]);
    });
  }

  Future<void> deleteEvent(int id) async {
    final db = await database;
    await db.delete(
      'events',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateEvent(EventModel event) async {
    final db = await database;
    await db.update(
      'events',
      event.toMap(),
      where: 'id = ?',
      whereArgs: [event.id], // Предполагается, что id у вас есть в модели EventModel
    );
  }
}
