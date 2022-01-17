import 'package:flutter_todo_bloc/db/database.dart';
import 'package:flutter_todo_bloc/models/todo.dart';

class TodoRepository {
  final db = DBProvider();

  Future getAllTodos() => db.getTodos();

  Future insertTodo(Todo todo) => db.createTodo(todo);

  Future updateTodo(Todo todo) => db.updateTodo(todo);

  Future deleteTodo(int id) => db.deleteTodo(id);

  Future deleteAllTodo(int id) => db.deleteAllTodo(id);
}
