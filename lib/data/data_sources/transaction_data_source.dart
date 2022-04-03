import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/database/db_util.dart';
import 'package:finq/database/finq_db.dart';
import 'package:finq/database/transactions_dao.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

abstract class TransactionDataSource {
  Future<void> insertNewTransaction(TransactionsCompanion transaction);
  Future<void> updateTransaction(TransactionsCompanion transaction);
  Future<void> deleteTransaction(int id);

  Stream<List<double>> getTotalAmount(DateTime startDate, DateTime endDate);

  Stream<List<Transaction>> getAllTransactionBetweenRange(
      DateTime startDate, DateTime endDate);
  Future<List<Transaction>> getTransactionListByTypeFilter(
      TransactionType type, DateTime startDate, DateTime endDate);
}

@LazySingleton(as: TransactionDataSource)
class TransactionDataSourceImpl extends TransactionDataSource {
  final DbUtil dbUtil;
  TransactionDataSourceImpl(this.dbUtil);

  @override
  Future<void> insertNewTransaction(TransactionsCompanion transaction) {
    return dbUtil.transactionDao.insertNewTransaction(transaction);
  }

  @override
  Future<void> updateTransaction(TransactionsCompanion transaction) {
    return dbUtil.transactionDao.updateTransaction(transaction);
  }

  @override
  Stream<List<Transaction>> getAllTransactionBetweenRange(
      DateTime startDate, DateTime endDate) {
    return dbUtil.transactionDao.watchTransactionsWithDates(startDate, endDate);
  }

  @override
  Future<List<Transaction>> getTransactionListByTypeFilter(
      TransactionType type, DateTime startDate, DateTime endDate) {
    final response = dbUtil.transactionDao
        .getTransactionsByFilterAndRange(type, startDate, endDate);
    debugPrint('DataSource ${response.toString()}');
    return response;
  }

  @override
  Future<void> deleteTransaction(int id) {
    return dbUtil.transactionDao.deleteTransaction(id);
  }

  @override
  Stream<List<double>> getTotalAmount(DateTime startDate, DateTime endDate) {
    // var incomeStream = dao.watchTotalIncomeAmount(startDate, endDate);
    // var expenseStream = dao.watchTotalExpenseAmount(startDate, endDate);

    return Rx.combineLatest([
      dbUtil.transactionDao.watchTotalIncomeAmount(startDate, endDate),
      dbUtil.transactionDao.watchTotalExpenseAmount(startDate, endDate)
    ], (values) => values.map((e) => e as double? ?? 0.0).toList());
  }
}
