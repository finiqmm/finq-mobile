part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class NewTransactionInsertEvent extends TransactionEvent {
  final TransactionEntity transactionEntity;

  NewTransactionInsertEvent(this.transactionEntity);
}
