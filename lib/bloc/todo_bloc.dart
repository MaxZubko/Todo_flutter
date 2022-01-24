// import 'dart:io';
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_todo_bloc/modules/archived_tasks_screen.dart';
// import 'package:flutter_todo_bloc/modules/done_tasks_screen.dart';
// import 'package:flutter_todo_bloc/modules/new_tasks_list.dart';
// import 'package:flutter_todo_bloc/shared/models/todo.dart';
// import 'package:flutter_todo_bloc/shared/repository/todo_repository.dart';
// part 'todo_event.dart';
// part 'todo_state.dart';

// class TodoBloc extends Bloc<TodoEvent, TodoState> {
//   final TodoRepository todoRepository;
//   // List<Map> newTasks = [];
//   // List<Map> doneTasks = [];
//   // List<Map> archivedTasks = [];

//   // int bottomNavigationIndex = 0;
//   // final List<Widget> screens = [
//   //   NewTasksScreen(),
//   //   DoneTasksScreen(),
//   //   ArchivedTasksScreen(),
//   // ];

//   List<String> titles = ['Todo Tasks', 'Done Tasks', 'Archived Tasks'];

//   TodoBloc(this.todoRepository) : super(TodoEmptyState()) {
//     // on<PageTapped>((event, emit) {
//     //   bottomNavigationIndex = event.index;
//     //   emit(AppChangeBottomNavBarState());
//     // });
//     on<LoadTodos>((event, emit) async {
//       emit(TodoLoadingState());
//       try {
//         final List<Todo> _loadedTodoList = await todoRepository.getAllTodos();
//         if (_loadedTodoList == null || _loadedTodoList.length == 0) {
//           emit(TodoEmptyState());
//         } else {
//           emit(TodoLoadedState(loadedUser: _loadedTodoList));
//         }
//       } catch (_) {
//         emit(TodoErrorState());
//       }
//     });
//     on<CreateTodos>((event, emit) async {
//       await todoRepository.insertTodo(event.todo);
//       final List<Todo> _loadedTodoList = await todoRepository.getAllTodos();
//       emit(TodoLoadedState(loadedUser: _loadedTodoList));
//     });
//     on<DeleteTodos>((event, emit) async {
//       await todoRepository.deleteTodo(event.id);
//       final List<Todo> _loadedTodoList = await todoRepository.getAllTodos();
//       emit(TodoLoadedState(loadedUser: _loadedTodoList));
//     });
//     on<UpdateTodos>((event, emit) async {
//       await todoRepository.updateTodo(event.todo);
//       final List<Todo> _loadedTodoList = await todoRepository.getAllTodos();
//       emit(TodoLoadedState(loadedUser: _loadedTodoList));
//     });
//   }
// }
