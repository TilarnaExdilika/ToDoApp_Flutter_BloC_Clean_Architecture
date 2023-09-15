import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lock_event.dart';
part 'lock_state.dart';

class LockBloc extends Bloc<LockEvent, LockState> {
  LockBloc() : super(LockInitial()) {
    on<LockEvent>((event, emit) {
      //
    });
  }
}
