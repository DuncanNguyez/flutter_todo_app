import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/data/models/models.dart';
import 'package:todoapp/utils/utils.dart';

class TaskDatasource {
  static final TaskDatasource _instance = TaskDatasource._();
  factory TaskDatasource() => _instance;
  static Database? _database;

  TaskDatasource._() {
    _initDb();
  }

  Future<Database> get database async {
    _database ??= await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "todo.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE ${AppKeys.dbTable} (
          ${AppKeys.taskKeys.id} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${AppKeys.taskKeys.title} TEXT,
            ${AppKeys.taskKeys.note} TEXT,
            ${AppKeys.taskKeys.date} TEXT,
            ${AppKeys.taskKeys.time} TEXT,
            ${AppKeys.taskKeys.category} TEXT,
            ${AppKeys.taskKeys.isCompleted} INTEGER
        )
    ''');
  }

  Future<int> addTask(Task task) async {
    Database db = await database;
    return db.transaction((txn) => txn.insert(AppKeys.dbTable, task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.rollback));
  }

  Future<List<Task>> getTasks() async {
    Database db = await database;
    final List<Map<String, dynamic>> res =
        await db.query(AppKeys.dbTable, orderBy: "id DESC");

    return List.generate(res.length, (index) => Task.fromMap(res[index]));
  }

  Future<int> updateTask(Task task) async {
    final db = await database;
    return db.transaction((txn) => txn.update(AppKeys.dbTable, task.toMap(),
        where: "id = ?",
        whereArgs: [task.id],
        conflictAlgorithm: ConflictAlgorithm.rollback));
  }

  Future<int> deleteTask(Task task) async {
    final db = await database;
    return db.transaction((txn) => txn.delete(
          AppKeys.dbTable,
          where: "id = ?",
          whereArgs: [task.id],
        ));
  }
}
