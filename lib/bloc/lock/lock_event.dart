part of 'lock_bloc.dart';

sealed class LockEvent extends Equatable {
  const LockEvent();
}

class HiveBoxOpeningEvent extends LockEvent {
  @override
  List<Object> get props => [];
}

class LoginButtonClickedEvent extends LockEvent {
  final int code;

  const LoginButtonClickedEvent(this.code);

  @override
  List<Object> get props => [code];
}

class RegisterButtonClickedEvent extends LockEvent {
  final int code;

  const RegisterButtonClickedEvent(this.code);

  @override
  List<Object> get props => [code];
}
