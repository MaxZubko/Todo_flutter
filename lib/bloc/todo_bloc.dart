import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_todo_bloc/models/todo.dart';
import 'package:flutter_todo_bloc/repository/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;

  TodoBloc(this.todoRepository) : super(TodoEmptyState()) {
    on<LoadTodos>((event, emit) async {
      emit(TodoLoadingState());
      try {
        final List<Todo> _loadedTodoList = await todoRepository.getAllTodos();
        emit(TodoLoadedState(loadedUser: _loadedTodoList));
      } catch (_) {
        emit(TodoErrorState());
      }
    });
    on<CreateTodos>((event, emit) async {
      // Todo todo = Todo(description: event.task, isDone: false);
      await todoRepository.insertTodo(event.todo);
      final List<Todo> _loadedTodoList = await todoRepository.getAllTodos();
      emit(TodoLoadedState(loadedUser: _loadedTodoList));
    });
    on<DeleteTodos>((event, emit) async {
      await todoRepository.deleteTodo(event.id);
      final List<Todo> _loadedTodoList = await todoRepository.getAllTodos();
      emit(TodoLoadedState(loadedUser: _loadedTodoList));
    });
    on<UpdateTodos>((event, emit) async {
      await todoRepository.updateTodo(event.todo);
      final List<Todo> _loadedTodoList = await todoRepository.getAllTodos();
      emit(TodoLoadedState(loadedUser: _loadedTodoList));
    });
  }
}
