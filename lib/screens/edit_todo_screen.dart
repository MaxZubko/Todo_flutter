import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_bloc/bloc/todo_bloc.dart';
import 'package:flutter_todo_bloc/models/todo.dart';

class EditTodoScreen extends StatelessWidget {
  final Todo todo;
  EditTodoScreen({Key? key, required this.todo}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = todo.description;

    return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Edit Todo',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        body: _body(context),
      );
    });
  }

  Widget _body(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextFormField(
            controller: _controller,
            autocorrect: true,
            decoration: const InputDecoration(hintText: 'Enter todo message'),
          ),
          const SizedBox(
            height: 10.0,
          ),
          InkWell(
            onTap: () {
              // BlocProvider.of<TodoBloc>(context)
              //     .add(UpdateTodos(Todo(description: _todoName)));
              final updateTodo = Todo(description: _controller.text);
              BlocProvider.of<TodoBloc>(context).add(
                UpdateTodos(
                  updateTodo,
                  // _controller.text,
                ),
              );
              Navigator.pop(context);
            },
            child: _updateBtn(context),
          )
        ],
      ),
    );
  }

  Widget _updateBtn(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10.0)),
      child: Center(
        child: Text(
          'Update Todo',
          style: TextStyle(
              fontSize: 17.0,
              color: Colors.amber.shade700,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
