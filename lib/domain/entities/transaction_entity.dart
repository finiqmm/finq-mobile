import 'package:equatable/equatable.dart';
import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/database/finq_db.dart';

class TransactionEntity extends Equatable {
  final int? id;
  final String description;
  final double amount;
  final DateTime transactionDate;
  final TransactionType transactionType;
  final String categoryName;

  TransactionEntity(
      {required this.id,
      required this.description,
      required this.amount,
      required this.transactionDate,
      required this.transactionType,
      required this.categoryName});

  @override
  String toString() {
    return '$id -- $description -- $amount';
  }

  TransactionEntity copyWith(
      {String? description,
      double? amount,
      DateTime? transactionDate,
      String? categoryName}) {
    return TransactionEntity(
        id: id,
        description: description ?? this.description,
        amount: amount ?? this.amount,
        transactionDate: transactionDate ?? this.transactionDate,
        categoryName: categoryName ?? this.categoryName,
        transactionType: this.transactionType);
  }

  @override
  List<Object?> get props =>
      [id, description, amount, transactionDate, transactionType, categoryName];
}
