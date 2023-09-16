import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tilarna_todo_app/repositories/lock_repository.dart';
import 'package:tilarna_todo_app/repositories/todo_repository.dart';

part 'lock_event.dart';
part 'lock_state.dart';

class LockBloc extends Bloc<LockEvent, LockState> {
  final LockRepository _lockRepository;
  final TodoRepository _todoRepository;
  LockBloc(this._lockRepository, this._todoRepository)
      : super(HiveBoxOpeningState()) {
    on<HiveBoxOpeningEvent>((event, emit) async {
      //
      try {
        await _lockRepository.init();
        await _todoRepository.init();
      } on Exception catch (e) {
        print(e.toString());
      }
      emit(LockInitial());
    });

    // Login bloc
    on<LoginButtonClickedEvent>((event, emit) async {
      final user = await _lockRepository.authenticate(event.code);
      if (user != null) {
        emit(LoggedInState(user));
        emit(LockInitial());
      } else {
        emit(const ErrorState('No records found regarding the user'));
      }
    });

    // register bloc
    on<RegisterButtonClickedEvent>((event, emit) async {
      final result = await _lockRepository.registerUser(event.code);
      switch (result) {
        case RegisterResponse.success:
          emit(LoggedInState(event.code));
          break;
        case RegisterResponse.failure:
          emit(const ErrorState(
              'An error occurred during Registration, Please try again'));
          break;
        case RegisterResponse.alreadyExists:
          emit(const ErrorState(
              'Looks like, this account already exists, Please try again'));
          break;
        default:
      }
    });
  }
}
