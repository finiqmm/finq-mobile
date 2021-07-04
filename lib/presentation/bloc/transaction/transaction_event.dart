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

class GetTotalIncomeEvent extends TransactionEvent {
  final DateTime startDate;
  final DateTime endDate;
  GetTotalIncomeEvent(this.startDate, this.endDate) : super();
}

class GetTotalExpenseEvent extends TransactionEvent {
  final DateTime startDate;
  final DateTime endDate;
  GetTotalExpenseEvent(this.startDate, this.endDate) : super();
}

class LoadTransactionBetweenRange extends TransactionEvent {
  final DateTime startDate;
  final DateTime endDate;
  LoadTransactionBetweenRange(this.startDate, this.endDate);
}

class LoadHomeScreenChartData extends TransactionEvent {
  final DateTime startDate;
  final DateTime endDate;
  final TransactionType type;
  LoadHomeScreenChartData(this.startDate, this.endDate, this.type);
}
