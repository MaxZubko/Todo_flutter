import 'package:flutter/material.dart';
import 'package:flutter_todo_bloc/cubit/todo_cubit.dart';

class TaskDoneItem extends StatelessWidget {
  Map? tasks;

  TaskDoneItem({this.tasks});
  @override
  Widget build(BuildContext context) {
    return Card(
      key: Key(tasks!['title']),
      shadowColor: Colors.blueGrey,
      margin: const EdgeInsets.only(left: 15, right: 15, top: 8),
      color: Colors.black,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade800, width: 0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      borderOnForeground: false,
      child: ListTile(
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            tasks!['title'],
            style: const TextStyle(
              fontSize: 21.0,
            ),
          ),
          Text(
            tasks!['status'],
            style: const TextStyle(fontSize: 21.0),
          ),
        ]),
        trailing: IconButton(
          tooltip: 'Archive Todo',
          highlightColor: Colors.red,
          onPressed: () {
            AppCubit.get(context).updateDatabase('Archive', tasks!['id']);
          },
          icon: const Icon(
            Icons.archive,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          tooltip: 'Restore Todo',
          highlightColor: Colors.green,
          onPressed: () {
            AppCubit.get(context).updateDatabase('New', tasks!['id']);
          },
          icon: const Icon(
            Icons.restore,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
