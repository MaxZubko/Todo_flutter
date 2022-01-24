import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_bloc/cubit/todo_cubit.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // final todoRepository = TodoRepository();
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
      providers: [BlocProvider(create: (_) => AppCubit())],
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
