part of 'transaction_entry_cubit.dart';

abstract class TransactionEntryState extends Equatable {
  const TransactionEntryState();

  @override
  List<Object> get props => [];
}

class TransactionEntryInitial extends TransactionEntryState {
  TransactionEntryInitial() : super();

  @override
  List<Object> get props => [];
}

class TransactionEntryProcessing extends TransactionEntryState {
  TransactionEntryProcessing() : super();

  @override
  List<Object> get props => [];
}

class TransactionEntrySuccess extends TransactionEntryState {
  TransactionEntrySuccess() : super();

  @override
  List<Object> get props => [];
}

class TransactionEntryFailed extends TransactionEntryState {
  final String message;
  TransactionEntryFailed(this.message) : super();

   @override
  List<Object> get props => [message];
}
