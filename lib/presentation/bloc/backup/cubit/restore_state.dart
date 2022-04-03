part of 'restore_cubit.dart';

abstract class RestoreState extends Equatable {
  const RestoreState();

  @override
  List<Object> get props => [];
}

class RestoreInitial extends RestoreState {}

class RestoreLoading extends RestoreState {}

class RestoteError extends RestoreState {
  final String errorMsg;
  RestoteError(this.errorMsg);
}

class RestoreSuccess extends RestoreState {}
