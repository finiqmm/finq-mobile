import 'package:equatable/equatable.dart';
import 'package:finq/domain/entities/transaction_entity.dart';

class TransactionUiModel extends Equatable {
  final String transactionDate;
  final String totalIncomeAmount;
  final String totalExpenseAmount;

  final List<TransactionEntity> transactionItems;

  TransactionUiModel(
      {required this.transactionDate,
      required this.totalIncomeAmount,
      required this.totalExpenseAmount,
      required this.transactionItems});

  
  @override
  String toString() {
    return '$transactionDate --  $totalIncomeAmount -- $totalExpenseAmount';
  }

  @override
  List<Object?> get props =>
      [transactionDate, totalIncomeAmount, totalExpenseAmount,transactionItems];
}
