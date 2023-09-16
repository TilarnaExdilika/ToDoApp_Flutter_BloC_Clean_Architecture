import 'package:hive_flutter/hive_flutter.dart';
import 'package:tilarna_todo_app/models/todo_model.dart';
import 'package:tilarna_todo_app/ui/widgets/toast_notification.dart';

class TodoRepository {
  late Box<TodoModel> _todo;

  Future<void> init() async {
    Hive.registerAdapter(TodoModelAdapter());
    _todo = await Hive.openBox<TodoModel>('todo_box');
  }

  List<TodoModel> getTodos(final int code) {
    final todos = _todo.values.where((element) => element.code == code);
    return todos.toList();
  }

  void addTodos(final int code, final int animationIndex, final String task,
      final int time, final int statusIndex) {
    _todo
        .add(TodoModel(code, animationIndex, task, time, statusIndex))
        .whenComplete(() => showToast('$task đã được thêm'));
  }

  Future<void> removeTodos(final int code, final String task) async {
    final taskToRemove = _todo.values
        .firstWhere((element) => element.code == code && element.task == task);
    await taskToRemove.delete().whenComplete(() => showToast('$task đã xóa'));
  }

  Future<void> updateTodos(final int code, final String task,
      final int animationIndex, final int time, final int statusIndex) async {
    final taskToEdit = _todo.values
        .firstWhere((element) => element.code == code && element.task == task);

    final index = taskToEdit.key as int;

    await _todo
        .put(index, TodoModel(code, animationIndex, task, time, statusIndex))
        .whenComplete(() => showToast('$task đã được cập nhật'));
  }
}
