import 'package:finq/data/tables/transaction.dart';
import 'package:finq/database/finq_db.dart';

abstract class TransactionDataSource {
  Future<void> insertNewTransaction(Transaction transaction);
  Future<void> updateTransaction(Transaction transaction);
}

class TransactionDataSourceImpl extends TransactionDataSource {
  final FinqDb db;
  TransactionDataSourceImpl({required this.db});

  @override
  Future<void> insertNewTransaction(Transaction transaction) {
    return db.transactionDao.insertTransaction(transaction);
  }

  @override
  Future<void> updateTransaction(Transaction transaction) {
    return db.transactionDao.updateTransaction(transaction);
  }
}
