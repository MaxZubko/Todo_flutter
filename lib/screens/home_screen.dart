import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_bloc/cubit/todo_cubit.dart';
import 'package:flutter_todo_bloc/cubit/todo_state.dart';

var scaffoldKey = GlobalKey<ScaffoldState>();
var titleController = TextEditingController();
var formKey = GlobalKey<FormState>();

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            // final TodoBloc bloc = context.read<TodoBloc>();
            AppCubit cubit = AppCubit.get(context);
            return Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.black,
                appBar: AppBar(
                  title: const Text(
                    'Todo',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                // body: bloc.screens[bloc.bottomNavigationIndex],
                body: cubit.screens[cubit.bottomNavigtionIndex],
                floatingActionButton: FloatingActionButton(
                  backgroundColor: const Color(0xff171717),
                  child: const Icon(Icons.edit, size: 32, color: Colors.white),
                  onPressed: () {
                    // final TodoBloc todoBloc = context.read<TodoBloc>();
                    // final _todoDescriptionFromController =
                    //     TextEditingController();
                    AppCubit cubit = AppCubit.get(context);
                    showModalBottomSheet(
                        context: context,
                        builder: (builder) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
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
                                      left: 15,
                                      top: 25.0,
                                      right: 15,
                                      bottom: 30),
                                  child: ListView(
                                    children: <Widget>[
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            child: TextFormField(
                                              controller: titleController,
                                              textInputAction:
                                                  TextInputAction.newline,
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
                                                      color:
                                                          Colors.amber.shade700,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 30.0)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, top: 15),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  const Color(0xff171717),
                                              radius: 18,
                                              child: IconButton(
                                                  icon: Icon(
                                                    Icons.save,
                                                    size: 22,
                                                    color:
                                                        Colors.amber.shade700,
                                                  ),
                                                  onPressed: () {
                                                    // final newTodo = Todo(
                                                    //     description:
                                                    //         _todoDescriptionFromController
                                                    //             .value.text,
                                                    //     status: 'New');
                                                    // if (newTodo
                                                    //     .description.isNotEmpty) {
                                                    //   bloc.add(
                                                    //       CreateTodos(newTodo));
                                                    cubit.inserToDatabase(
                                                        title: titleController
                                                            .text);
                                                    Navigator.pop(context);
                                                    titleController.clear();
                                                  }),
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
                bottomNavigationBar: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.white10, width: 1),
                    ),
                  ),
                  child: BottomNavigationBar(
                    selectedFontSize: 15.0,
                    selectedIconTheme:
                        IconThemeData(color: Colors.amber.shade700, size: 30),
                    unselectedItemColor: Colors.grey,
                    backgroundColor: const Color(0xff171717),
                    selectedItemColor: Colors.amber.shade700,
                    selectedLabelStyle:
                        const TextStyle(fontWeight: FontWeight.bold),
                    currentIndex: cubit.bottomNavigtionIndex,
                    // currentIndex: _selectedIndex,
                    onTap: (index) {
                      cubit.changeIndex(index);
                    },
                    // onTap: _onItemTapped,
                    type: BottomNavigationBarType.fixed,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.menu), label: 'Tasks'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.check_circle_outline),
                          label: 'Done'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.archive_outlined),
                          label: 'Archived'),
                    ],
                  ),
                ));
          }),
    );
  }
}
