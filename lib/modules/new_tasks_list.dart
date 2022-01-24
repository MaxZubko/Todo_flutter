import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_bloc/cubit/todo_cubit.dart';
import 'package:flutter_todo_bloc/cubit/todo_state.dart';
import 'package:flutter_todo_bloc/shared/widgets/tasks_item.dart';

class NewTasksScreen extends StatelessWidget {
// class NewTasksScreen extends StatefulWidget {
//   @override
//   State<NewTasksScreen> createState() => _NewTasksScreen();
// }

// class _NewTasksScreen extends State<NewTasksScreen> {
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<TodoBloc>(context).add(LoadTodos());
//   }

  // @override
  // void dispose() {
  //   BlocProvider.of<TodoBloc>(context).close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).newTasks;
        return SingleChildScrollView(
          child: Column(children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: tasks.length,
              itemBuilder: (context, index) => TaskItem(tasks: tasks[index]),
            ),
          ]),
        );
      },
    );
    // if (state is TodoEmptyState) {
    //   return const Center(
    //     child: Text(
    //       'No todo. Add your first task',
    //       style: TextStyle(fontSize: 20.0, color: Colors.white),
    //     ),
    //   );
    // }

    // if (state is TodoLoadingState) {
    //   return const Center(child: CircularProgressIndicator());
    // }

    // if (state is TodoLoadedState) {

    // }
    // if (state is TodoErrorState) {
    //   return const Center(
    //       child: Text(
    //     'Error fetching todos',
    //     style: TextStyle(fontSize: 20.0, color: Colors.white),
    //   ));
    // }
    // return const SizedBox.shrink();
    // });
  }
}
