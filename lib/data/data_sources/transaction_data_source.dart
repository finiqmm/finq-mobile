import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/database/finq_db.dart';

abstract class TransactionDataSource {
  Future<void> insertNewTransaction(TransactionsCompanion transaction);
  Future<void> updateTransaction(TransactionsCompanion transaction);
  Future<double?> getTotalAmountOfType(TransactionType transactionType, DateTime startDate, DateTime endDate);
  
}

class TransactionDataSourceImpl extends TransactionDataSource {
  final FinqDb db;
  TransactionDataSourceImpl(this.db);

  @override
  Future<void> insertNewTransaction(TransactionsCompanion transaction) {
    return db.insertNewTransaction(transaction);
  }

  @override
  Future<void> updateTransaction(TransactionsCompanion transaction) {
    return db.updateTransaction(transaction);
  }

  @override
  Future<double?> getTotalAmountOfType(
      TransactionType transactionType, DateTime startDate, DateTime endDate) {
    return db.getTotalTransactionAmount(transactionType, startDate, endDate);
  }
}
