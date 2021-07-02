import 'package:finq/database/database.dart';
import 'package:finq/database/database.dart';

abstract class TransactionDataSource {
  Future<void> insertNewTransaction(Transaction transaction);
  Future<void> updateTransaction(Transaction transaction);
}

class TransactionDataSourceImpl extends TransactionDataSource {
  // final FinqDb db;
  TransactionDataSourceImpl();

  @override
  Future<void> insertNewTransaction(Transaction transaction) {
    return Future.delayed(Duration(milliseconds: 2));
    // return db.transactionDao.insertTransaction(transaction);
  }

  @override
  Future<void> updateTransaction(Transaction transaction) {
    return Future.delayed(Duration(milliseconds: 2));

    // return db.transactionDao.updateTransaction(transaction);
  }
}
