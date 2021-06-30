import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/domain/entities/transaction_entity.dart';
import 'package:floor/floor.dart';

//1 for income
//0 for expense

@entity
class Transaction {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String description;
  final String categoryType;
  final double amount;
  final TransactionType transactionType;
  final DateTime transactionDate;

  Transaction(this.id, this.description, this.categoryType, this.amount,
      this.transactionType, this.transactionDate);

  @override
  String toString() {
    return 'Trasaction{id:$id,amount:$amount,desc:$description}';
  }

  factory Transaction.fromTransactionEntity(TransactionEntity entity) {
    return Transaction(entity.id, entity.description, entity.categoryName,
        entity.amount, entity.transactionType, entity.transactionDate);
  }
}
