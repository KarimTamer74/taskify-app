import 'dart:async';
import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/features/add_task/data/models/task_data_model.dart';

class DbHelper {
  static Database? _db;

  static const String _tableName = 'tasks';
  static const int _version = 1;
  static Future<void> initDb() async {
    if (_db != null) {
      return;
    } else {
      try {
        var databasesPath = await getDatabasesPath();
        String path = join(databasesPath, 'my_db.db');
        _db = await openDatabase(path, version: _version, onCreate: _onCreate);
        log("Database initialized at path: $path");
      } catch (e) {
        log("Error initializing database: $e");
      }
    }
  }

  static FutureOr<void> _onCreate(Database db, int version) async {
    log("Creating database and table $_tableName");
    await db.execute('''
    CREATE TABLE $_tableName (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title STRING,
      description STRING,
      date STRING,
      startTime STRING,
      endTime STRING,
      reminder STRING,
      repeat STRING,
      cardColor INTEGER,
      isCompleted INTEGER,
      categoryName STRING,
      iconPath TEXT,
      categoryColor INTEGER
    )
    ''');
  }

  static Future<TaskDataModel> insertTask(TaskDataModel task) async {
    if (_db == null) {
      await initDb();
    } else {
      task.homeTaskDataModel.id = await _db!.insert(_tableName, task.toMap());
      log("Task inserted with ID: ${task.homeTaskDataModel.id}");
      log("Task data: ${task.toMap()}");
      return task;
    }
    return task;
  }

  static Future<List<TaskDataModel>> getAllTasks() async {
    final List<Map<String, dynamic>> maps = await _db!.query(_tableName);
    return maps.map((map) => TaskDataModel.fromMap(map)).toList();
  }

  static Future<List<TaskDataModel>> getTasksByDate(String date) async {
    final List<Map<String, dynamic>> maps =
        await _db!.query(_tableName, where: 'date = ?', whereArgs: [date]);
    return maps.map((map) => TaskDataModel.fromMap(map)).toList();
  }

  static Future<int> deleteTask(int id) async {
    log("Deleting task with ID: $id");
    return await _db!.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> updateTask(int id, value) async {
    log("uptade task with id: $id");
    return await _db!.rawUpdate(
        'UPDATE $_tableName SET isCompleted = ? WHERE id = ?', [value, id]);
  }

  static Future<int> editTask(TaskDataModel task) async {
    if (_db == null) {
      await initDb();
    }

    final id = task.homeTaskDataModel.id;
    if (id == null) {
      log("Cannot update task: ID is null");
      return 0;
    }

    log("Updating task with ID: $id");
    var result = await _db!.update(
      _tableName,
      task.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
    log("Task updated with result: $result");
    return result;
  }
}
