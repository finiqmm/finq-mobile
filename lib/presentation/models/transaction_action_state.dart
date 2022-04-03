import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/domain/entities/transaction_entity.dart';

class TransactionActionModel {
  final int? id;
  final String desc;
  final String? categoryName;
  final DateTime? transactionDate;
  final TransactionType transactionType;
  final double totalAmount;

  TransactionActionModel({
    this.id,
    this.categoryName,
    this.transactionDate,
    this.desc = '',
    this.totalAmount = 0,
    required this.transactionType,
  });

  factory TransactionActionModel.fromTransactionEntity(
      TransactionEntity entity) {
    return TransactionActionModel(
        id: entity.id,
        desc: entity.description,
        categoryName: entity.categoryName,
        transactionDate: entity.transactionDate,
        transactionType: entity.transactionType,
        totalAmount: entity.amount);
  }
}
