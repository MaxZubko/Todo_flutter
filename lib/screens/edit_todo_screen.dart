import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_todo_bloc/cubit/todo_cubit.dart';
import 'package:flutter_todo_bloc/cubit/todo_state.dart';

class EditTodoScreen extends StatelessWidget {
  // Map? tasks;
  String title;
  int id;
  EditTodoScreen({Key? key, required this.title, required this.id})
      : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = title;

    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
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
            maxLines: 2,
            decoration: const InputDecoration(hintText: 'Enter todo message'),
          ),
          const SizedBox(
            height: 10.0,
          ),
          // ElevatedButton(
          //   // style:,
          //   onPressed: () {
          //     AppCubit.get(context).updateDatabase('Done', id);
          //   },
          //   child: Text(
          //     'Update Data',
          //     style: TextStyle(color: Colors.amber.shade700),
          //   ),
          // ),
          InkWell(
            onTap: () {
              AppCubit.get(context).updateDatabase('Done', id);
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
