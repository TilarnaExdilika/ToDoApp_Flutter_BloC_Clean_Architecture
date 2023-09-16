import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tilarna_todo_app/bloc/lock/lock_bloc.dart';
import 'package:tilarna_todo_app/repositories/lock_repository.dart';
import 'package:tilarna_todo_app/repositories/todo_repository.dart';
import 'package:tilarna_todo_app/ui/lock_screen.dart';
import 'package:tilarna_todo_app/util/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Hive Dependency
  await Hive.initFlutter();
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
        home: BlocProvider(
          create: (context) => LockBloc(
            RepositoryProvider.of<LockRepository>(context),
            RepositoryProvider.of<TodoRepository>(context),
          )..add(HiveBoxOpeningEvent()),
          child: LockScreen(),
        ),
      ),
    );
  }
}
