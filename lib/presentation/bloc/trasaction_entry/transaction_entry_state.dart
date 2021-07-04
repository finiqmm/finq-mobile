part of 'transaction_entry_cubit.dart';

abstract class TransactionEntryState extends Equatable {
  const TransactionEntryState();

  @override
  List<Object> get props => [];
}

class TransactionEntryInitial extends TransactionEntryState {
  TransactionEntryInitial() : super();
}

class TransactionEntrySuccess extends TransactionEntryState {
  TransactionEntrySuccess() : super();
}

class TransactionEntryFailed extends TransactionEntryState {
  final String message;
  TransactionEntryFailed(this.message) : super();
}
