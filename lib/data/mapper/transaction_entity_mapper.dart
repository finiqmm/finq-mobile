import 'package:finq/database/finq_db.dart';
import 'package:finq/domain/entities/transaction_entity.dart';
import 'package:moor_flutter/moor_flutter.dart';

class TransactionEntityMapper {
  TransactionsCompanion from(TransactionEntity entity) {
    return TransactionsCompanion(
        description: Value(entity.description),
        categoryType: Value(entity.categoryName),
        amount: Value(entity.amount),
        transactionDate: Value(entity.transactionDate),
        transactionType: Value(entity.transactionType));
  }
}
