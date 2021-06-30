import 'package:equatable/equatable.dart';
import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/data/tables/transaction.dart';

class TransactionEntity extends Equatable {
  final int? id;
  final String description;
  final double amount;
  final DateTime transactionDate;
  final TransactionType transactionType;
  final String categoryName;

  TransactionEntity(this.id, this.description, this.amount,
      this.transactionDate, this.transactionType, this.categoryName);
  @override
  String toString() {
    return '$id -- $description -- $amount';
  }

  Transaction toTransaction(TransactionEntity transaction) {
    return Transaction(
        transaction.id,
        transaction.description,
        transaction.categoryName,
        transaction.amount,
        transaction.transactionType,
        transaction.transactionDate);
  }

  @override
  List<Object?> get props =>
      [id, description, amount, transactionDate, transactionType, categoryName];
}
