import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_bloc/cubit/todo_state.dart';
import 'package:flutter_todo_bloc/modules/archived_tasks_screen.dart';
import 'package:flutter_todo_bloc/modules/done_tasks_screen.dart';
import 'package:flutter_todo_bloc/modules/new_tasks_list.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  int bottomNavigtionIndex = 0;
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen()
  ];
  Database? database;

  void changeIndex(int index) {
    bottomNavigtionIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  void updateDatabase(String status, int id) async {
    database!.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?', [status, id]).then((value) {
      getDataBase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void deleteFromDatabase(int id) async {
    database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDataBase(database);
      emit(AppDeleteDatabaseState());
    });
  }

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, status TEXT)')
            .then((value) => print('Table Created'))
            .catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataBase(database);
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  void getDataBase(database) async {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    database!.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        print(element['id']);
        if (element['status'] == 'New') {
          newTasks.add(element);
        } else if (element['status'] == 'Done') {
          doneTasks.add(element);
        } else {
          archivedTasks.add(element);
        }
      });
      emit(AppGetDatabaseState());
    });
  }

  inserToDatabase({required String title}) async {
    await database!.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO tasks (title, status) VALUES ("$title","New")')
          .then((value) {
        getDataBase(database);
        print('$value Inserted Successfully');
        emit(AppInsertDatabaseState());
      }).catchError((error) {
        print('Error When inserting Table ${error.toString()}');
      });
    });
  }
}
