part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class LoadTodos extends TodoEvent {}

class CreateTodos extends TodoEvent {
  final Todo todo;

  const CreateTodos(this.todo);
}

class UpdateTodos extends TodoEvent {
  final Todo todo;

  const UpdateTodos(this.todo);
  @override
  List<Object> get props => [todo];
}

class DeleteTodos extends TodoEvent {
  final int id;

  const DeleteTodos({required this.id});
}

class QueryTodo extends TodoEvent {}

// class DeleteAllTodos extends TodoEvent {
//   final int id;

//   DeleteAllTodos({required this.id});
// }