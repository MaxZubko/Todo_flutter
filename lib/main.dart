import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_bloc/bloc/todo_bloc.dart';
import 'repository/todo_repository.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final todoRepository = TodoRepository();
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
      providers: [BlocProvider(create: (_) => TodoBloc(todoRepository))],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            bottomSheetTheme:
                const BottomSheetThemeData(backgroundColor: Colors.black38)),
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ));
}
