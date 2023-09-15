import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilarna_todo_app/repositories/lock_repository.dart';
import 'package:tilarna_todo_app/repositories/todo_repository.dart';
import 'package:tilarna_todo_app/ui/lock_screen.dart';
import 'package:tilarna_todo_app/util/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => LockRepository()),
        RepositoryProvider(create: (context) => TodoRepository()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(null),
        home: const LockScreen(),
      ),
    );
  }
}
