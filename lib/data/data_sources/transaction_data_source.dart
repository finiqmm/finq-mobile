import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/database/finq_db.dart';
import 'package:flutter/material.dart';

abstract class TransactionDataSource {
  Future<void> insertNewTransaction(TransactionsCompanion transaction);
  Future<void> updateTransaction(TransactionsCompanion transaction);
  Future<double?> getTotalAmountOfType(
      TransactionType transactionType, DateTime startDate, DateTime endDate);
  Stream<List<Transaction>> getAllTransactionBetweenRange(
      DateTime startDate, DateTime endDate);
  Future<List<Transaction>> getTransactionListByTypeFilter(
      TransactionType type, DateTime startDate, DateTime endDate);
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

  @override
  Stream<List<Transaction>> getAllTransactionBetweenRange(
      DateTime startDate, DateTime endDate) {
    return db.watchTransactionsWithDates(startDate, endDate);
  }

  @override
  Future<List<Transaction>> getTransactionListByTypeFilter(
      TransactionType type, DateTime startDate, DateTime endDate) {
    final response =
        db.getTransactionsByFilterAndRange(type, startDate, endDate);
    debugPrint('DataSource ${response.toString()}');
    return response;
  }
}
