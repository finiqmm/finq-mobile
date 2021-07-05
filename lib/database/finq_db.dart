import 'package:finq/common/constants/transaction_type.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'finq_db.g.dart';

class Transactions extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get description => text()();
  TextColumn get categoryType => text()();
  RealColumn get amount => real()();
  DateTimeColumn get transactionDate => dateTime()();
  IntColumn get transactionType => intEnum<TransactionType>()();

  @override
  String toString() {
    return 'Trasaction{id:$id,amount:$amount,desc:$description}';
  }
}

@UseMoor(tables: [
  Transactions
], queries: {
  "sumofTransactionAmount":
      "SELECT SUM(amount) FROM transactions WHERE transaction_date>=:startDate AND transaction_date<=:endDate AND transaction_type=:transType"
})
class FinqDb extends _$FinqDb {
  FinqDb()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future insertNewTransaction(TransactionsCompanion transactionItem) =>
      into(transactions).insert(transactionItem);
  Future updateTransaction(TransactionsCompanion transactionData) =>
      update(transactions).replace(transactionData);
  Future deleteTransaction(int id) =>
      (delete(transactions)..where((t) => t.id.equals(id))).go();

  Stream<List<Transaction>> watchAllTransactions() =>
      select(transactions).watch();
  Future<double?> getTotalTransactionAmount(
          TransactionType type, DateTime startDate, DateTime endDate) =>
      sumofTransactionAmount(startDate, endDate, type.index).getSingleOrNull();
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
              (tbl) => tbl.transactionDate.isBetweenValues(startDate, endDate)))
        .watch();
  }
}
