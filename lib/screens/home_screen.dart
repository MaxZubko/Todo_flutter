import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_bloc/bloc/todo_bloc.dart';
import 'package:flutter_todo_bloc/models/todo.dart';
import 'package:flutter_todo_bloc/repository/todo_repository.dart';
import 'package:flutter_todo_bloc/widgets/todo_list.dart';

class HomePage extends StatelessWidget {
  final todoRepository = TodoRepository();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            'Todo',
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TodoList(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff171717),
          child: const Icon(Icons.edit, size: 32, color: Colors.white),
          onPressed: () {
            final TodoBloc todoBloc = context.read<TodoBloc>();
            final _todoDescriptionFromController = TextEditingController();
            showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      color: Colors.transparent,
                      child: Container(
                        height: 230,
                        decoration: const BoxDecoration(
                            color: Color(0xff171717),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 25.0, right: 15, bottom: 30),
                          child: ListView(
                            children: <Widget>[
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: TextFormField(
                                      controller:
                                          _todoDescriptionFromController,
                                      textInputAction: TextInputAction.newline,
                                      maxLines: 4,
                                      style: const TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w400),
                                      autofocus: true,
                                      decoration: InputDecoration(
                                          hintText: 'I have to...',
                                          hintStyle: const TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.white,
                                          ),
                                          labelText: 'New Todo',
                                          labelStyle: TextStyle(
                                              color: Colors.amber.shade700,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 30.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 15),
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xff171717),
                                      radius: 18,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.save,
                                          size: 22,
                                          color: Colors.amber.shade700,
                                        ),
                                        onPressed: () {
                                          final newTodo = Todo(
                                              description:
                                                  _todoDescriptionFromController
                                                      .value.text);
                                          if (newTodo.description.isNotEmpty) {
                                            todoBloc.add(CreateTodos(newTodo));
                                            Navigator.pop(context);
                                          }
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          },
        ),
      );
    });
  }
}
