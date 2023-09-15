import 'package:hive_flutter/hive_flutter.dart';
import 'package:tilarna_todo_app/models/lock_model.dart';

class LockRepository {
  late Box<LockModel> _lock;

// create/open the box for lock model
  Future<void> init() async {
    Hive.registerAdapter(LockModelAdapter());
    _lock = await Hive.openBox<LockModel>('lock_box');
  }

  // for registing the code for the particular user...
  // _lock.add(LockModel(code)); will be called if successful ? return failure
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

  //for authenting login the User using the code...
  Future<int?> authenticate(final int code) async {
    final success = await _lock.values.any((element) => element.code == code);
    if (success) {
      return code;
    } else {
      return null;
    }
  }
}

// for getting a bool response from the function calling...
enum RegisterResponse { success, failure, alreadyExists }
