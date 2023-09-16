import 'package:hive_flutter/hive_flutter.dart';
import 'package:tilarna_todo_app/models/lock_model.dart';

class LockRepository {
  late Box<LockModel> _lock;

  Future<void> init() async {
    Hive.registerAdapter(LockModelAdapter());
    _lock = await Hive.openBox<LockModel>('lock_box');
  }

  Future<RegisterResponse> registerUser(final int code) async {
    final alreadyExists = _lock.values.any((element) => element.code == code);
    if (alreadyExists) {
      return RegisterResponse.alreadyExists;
    }
    try {
      _lock.add(LockModel(code));
      return RegisterResponse.success;
    } on Exception catch (e) {
      return RegisterResponse.failure;
    }
  }

  Future<int?> authenticate(final int code) async {
    final success = await _lock.values.any((element) => element.code == code);
    if (success) {
      return code;
    } else {
      return null;
    }
  }
}

enum RegisterResponse { success, failure, alreadyExists }
