import 'package:finq/common/constants/transaction_type.dart';
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
  final TransactionsDao dao;
  TransactionDataSourceImpl(this.dao);

  @override
  Future<void> insertNewTransaction(TransactionsCompanion transaction) {
    return dao.insertNewTransaction(transaction);
  }

  @override
  Future<void> updateTransaction(TransactionsCompanion transaction) {
    return dao.updateTransaction(transaction);
  }

  @override
  Stream<List<Transaction>> getAllTransactionBetweenRange(
      DateTime startDate, DateTime endDate) {
    return dao.watchTransactionsWithDates(startDate, endDate);
  }

  @override
  Future<List<Transaction>> getTransactionListByTypeFilter(
      TransactionType type, DateTime startDate, DateTime endDate) {
    final response =
        dao.getTransactionsByFilterAndRange(type, startDate, endDate);
    debugPrint('DataSource ${response.toString()}');
    return response;
  }

  @override
  Future<void> deleteTransaction(int id) {
    return dao.deleteTransaction(id);
  }

  @override
  Stream<List<double>> getTotalAmount(DateTime startDate, DateTime endDate) {
    // var incomeStream = dao.watchTotalIncomeAmount(startDate, endDate);
    // var expenseStream = dao.watchTotalExpenseAmount(startDate, endDate);

    return Rx.combineLatest([
      dao.watchTotalIncomeAmount(startDate, endDate),
      dao.watchTotalExpenseAmount(startDate, endDate)
    ], (values) => values.map((e) => e as double? ?? 0.0).toList());
  }
}
