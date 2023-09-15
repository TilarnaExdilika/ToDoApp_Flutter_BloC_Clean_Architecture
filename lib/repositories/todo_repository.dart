import 'package:hive_flutter/hive_flutter.dart';
import 'package:tilarna_todo_app/models/todo_model.dart';

class TodoRepository {
  late Box<TodoModel> _todo;

  Future<void> init() async {
    Hive.registerAdapter(TodoModelAdapter());
    _todo = await Hive.openBox<TodoModel>('todo_box');
  }

  getToDos() {}
  addToDos() {}
  removeToDos() {}
  updateToDos() {}
}
