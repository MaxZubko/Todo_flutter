import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_bloc/bloc/todo_bloc.dart';
import 'package:flutter_todo_bloc/screens/edit_todo_screen.dart';

class TodoList extends StatefulWidget {
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TodoBloc>(context).add(LoadTodos());
  }

  @override
  void dispose() {
    BlocProvider.of<TodoBloc>(context).close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TodoBloc todoBloc = context.read<TodoBloc>();
    return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      if (state is TodoEmptyState) {
        return const Center(
          child: Text(
            'No Todo',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        );
      }

      if (state is TodoLoadingState) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is TodoLoadedState) {
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) => Card(
                  shadowColor: Colors.blueGrey,
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 8),
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey.shade800, width: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  borderOnForeground: false,
                  child: ListTile(
                    title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${state.loadedUser[index].description}',
                            style: const TextStyle(
                              fontSize: 21.0,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Text('${state.loadedUser[index].id}'),
                        ]),
                    trailing: IconButton(
                      tooltip: 'Delete Todo',
                      highlightColor: Colors.red,
                      onPressed: () {
                        todoBloc
                            .add(DeleteTodos(id: state.loadedUser[index].id));
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditTodoScreen(
                            todo: state.loadedUser[index],
                          ),
                        ),
                      );
                    },
                  ),
                ));
      }
      return const SizedBox.shrink();
    });
  }
}
