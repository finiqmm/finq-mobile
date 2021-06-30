part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class InsertSuccess extends TransactionState {}

class TransactionError extends TransactionState {
  final String message;

  TransactionError(this.message);
}
