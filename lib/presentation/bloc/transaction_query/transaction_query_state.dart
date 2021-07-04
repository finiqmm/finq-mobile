part of 'transaction_query_bloc.dart';

abstract class TransactionQueryState extends Equatable {
  const TransactionQueryState();
  
  @override
  List<Object> get props => [];
}

class TransactionQueryInitial extends TransactionQueryState {}
