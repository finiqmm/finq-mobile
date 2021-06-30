import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/domain/entities/transaction_entity.dart';

// abstract class TransactionActionState {}

// class TransactionUpdateState extends TransactionActionState {
//   final TransactionEntity transactionEntity;

//   TransactionUpdateState(this.transactionEntity) : super();
// }

// class TransactionInsertAction extends TransactionActionState {
//   final TransactionType transactionType;

//   TransactionInsertAction(this.transactionType) : super();
// }

class TransactionActionModel {
  final int? id;
  final String desc;
  final String? categoryName;
  final DateTime? transactionDate;
  final TransactionType transactionType;

  TransactionActionModel({
    this.id,
    this.categoryName,
    this.transactionDate,
    this.desc = '',
    required this.transactionType,
  });

  factory TransactionActionModel.fromTransactionEntity(
      TransactionEntity entity) {
    return TransactionActionModel(
        id: entity.id,
        desc: entity.description,
        categoryName: entity.categoryName,
        transactionDate: entity.transactionDate,
        transactionType: entity.transactionType);
  }
}
