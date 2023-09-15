part of 'lock_bloc.dart';

sealed class LockState extends Equatable {
  const LockState();
  
  @override
  List<Object> get props => [];
}

final class LockInitial extends LockState {}
