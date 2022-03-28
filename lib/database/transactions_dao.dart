import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/database/db_util.dart';
import 'package:finq/database/finq_db.dart';
import 'package:injectable/injectable.dart';
import 'package:drift/drift.dart';

part 'transactions_dao.g.dart';

@DriftAccessor(tables: [Transactions])
class TransactionsDao extends DatabaseAccessor<FinqDb>
    with _$TransactionsDaoMixin {
  final FinqDb db;

  TransactionsDao(this.db) : super(db);
  //static TransactionsDao? _instance;
  // factory FinqDb() => _instance;

  // static TransactionsDao getInstance() {
  //   if (_instance == null) {
  //     _instance = TransactionsDao._(FinqDb.getInstance());
  //   }
  //   return _instance!;
  // }

  Future insertNewTransaction(TransactionsCompanion transactionItem) =>
      into(transactions).insert(transactionItem);

  Future updateTransaction(TransactionsCompanion transactionData) =>
      update(transactions).replace(transactionData);

  Future deleteTransaction(int id) =>
      (delete(transactions)..where((t) => t.id.equals(id))).go();

  Stream<List<Transaction>> watchAllTransactions() =>
      select(transactions).watch();

  Stream<double?> watchTotalIncomeAmount(
          DateTime startDate, DateTime endDate) =>
      db
          .sumofTransactionAmount(
              startDate, endDate, TransactionType.INCOME.index)
          .watchSingleOrNull();
  Stream<double?> watchTotalExpenseAmount(
          DateTime startDate, DateTime endDate) =>
      db
          .sumofTransactionAmount(
              startDate, endDate, TransactionType.EXPENSE.index)
          .watchSingleOrNull();

  // Stream<double> watchTotalExpenseAmount(DateTime startDate, DateTime endDate){
  // }
  // db
  //     .sumofTransactionAmount(
  //         startDate, endDate, TransactionType.EXPENSE.index)
  //     .watchSingle();

  Future<double?> getTotalTransactionAmount(
          TransactionType type, DateTime startDate, DateTime endDate) =>
      db
          .sumofTransactionAmount(startDate, endDate, type.index)
          .getSingleOrNull();

  Future<List<Transaction>> getTransactionsByFilterAndRange(
          TransactionType type, DateTime startDate, DateTime endDate) =>
      (select(transactions)
            ..where((tbl) =>
                tbl.transactionDate.isBetweenValues(startDate, endDate))
            ..where((tbl) => tbl.transactionType.equals(type.index)))
          .get();

  Stream<List<Transaction>> watchTransactionsWithDates(
      DateTime startDate, DateTime endDate) {
    return (select(transactions)
          ..where(
              (tbl) => tbl.transactionDate.isBetweenValues(startDate, endDate))
          ..orderBy([
            (u) => OrderingTerm(
                expression: u.transactionDate, mode: OrderingMode.desc)
          ]))
        .watch();
  }
}
