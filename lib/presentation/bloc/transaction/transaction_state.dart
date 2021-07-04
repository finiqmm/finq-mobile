part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

// class InsertSuccess extends TransactionState {}

class TransactionError extends TransactionState {
  final String message;

  TransactionError(this.message);
}

class TotalIncomeAmountState extends TransactionState {
  final double amount;
  TotalIncomeAmountState(this.amount);
}

class TotalExpenseAmountState extends TransactionState {
  final double amount;
  TotalExpenseAmountState(this.amount);
}

class TransactionListLoadedState extends TransactionState {
  final List<TransactionUiModel> transactionUiModel;

  TransactionListLoadedState(this.transactionUiModel);
}

// class HomeChartDataLoadingState extends TransactionState {}

// class HomeChartDataLoadedState extends TransactionState {
//   final List<TransactionChartUiModel> chartItems;
//   final int time;

//   HomeChartDataLoadedState(this.chartItems, this.time) : super();
// }

// class TotalAmountState extends TransactionState {
//   final double amount;
//   final TransactionType transactionType;

//   TotalAmountState(this.amount, this.transactionType):super();
// }
