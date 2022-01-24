// import 'dart:async';
// import 'dart:io';
// import 'package:flutter_todo_bloc/shared/models/todo.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// class DBProvider {
//   // DBProvider._(); //паттерн Singleton
//   // static final DBProvider db =
//   //     DBProvider._(); //через эту переменную обращаемся к нашим методам
//   static final DBProvider db = DBProvider();

//   static late Database _database;

//   String todoTable = 'Todo';
//   String columnId = 'id';
//   String columnName = 'description';
//   String status = 'status';

//   List<Map> newTasks = [];
//   List<Map> doneTasks = [];
//   List<Map> archivedTasks = [];

//   Future<Database> get database async {
//     _database = await _initDB();
//     return _database;
//   }

//   Future<Database> _initDB() async {
//     Directory dir = await getApplicationDocumentsDirectory();
//     String path = dir.path + 'Todo.db';
//     return await openDatabase(path, version: 1, onCreate: _createDB);
//   }

//   void _createDB(Database db, int version) async {
//     await db.execute("CREATE TABLE $todoTable ("
//         "$columnId INTEGER PRIMARY KEY AUTOINCREMENT, "
//         "$columnName TEXT, "
//         "$status TEXT "
//         ")");
//   }

//   Future<int> createTodo(Todo todo) async {
//     Database db = await database;
//     var result = db.insert(todoTable, todo.toMap());
//     return result;
//   }

//   Future<List<Todo>> getTodos() async {
//     Database db = await database;
//     final List<Map<String, dynamic>> todoMapList = await db.query(todoTable);
//     final List<Todo> todoList = [];
//     todoMapList.forEach((todoMap) {
//       todoList.add(Todo.fromMap(todoMap));
//     });

//     return todoList;
//   }

//   Future<int> updateTodo(Todo todo) async {
//     Database db = await database;
//     return await db.update(todoTable, todo.toMap(),
//         where: '$columnId = ?', whereArgs: [todo.id]);
//   }

//   Future<int> deleteTodo(int id) async {
//     Database db = await database;
//     return await db.delete(todoTable, where: '$columnId = ?', whereArgs: [id]);
//   }

//   Future<int> deleteAllTodo(int id) async {
//     Database db = await database;
//     return await db.delete(todoTable);
//   }
// }
