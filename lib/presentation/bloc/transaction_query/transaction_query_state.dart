part of 'transaction_query_cubit.dart';

abstract class TransactionQueryState extends Equatable {
  const TransactionQueryState();

  @override
  List<Object> get props => [];
}

class TransactionQueryInitial extends TransactionQueryState {}

class TransactionQueryLoading extends TransactionQueryState {}

class TransactionQueryError extends TransactionQueryState {
  final String message;

  TransactionQueryError(this.message);
}

class TransactionListQueryLoadedState extends TransactionQueryState {
  final List<TransactionUiModel> transactionUiModel;

  TransactionListQueryLoadedState(this.transactionUiModel);

  @override
  List<Object> get props => [transactionUiModel];
}
