import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_bloc/cubit/todo_cubit.dart';
import 'package:flutter_todo_bloc/cubit/todo_state.dart';
import 'package:flutter_todo_bloc/shared/widgets/tasks_delete_item.dart';

class ArchivedTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var tasks = AppCubit.get(context).archivedTasks;
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: tasks.length,
                    itemBuilder: (context, index) => TaskDeleteItem(
                          tasks: tasks[index],
                        )),
              ],
            ),
          );
        });
  }
}
