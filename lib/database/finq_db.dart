import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/database/transactions_dao.dart';
import 'package:injectable/injectable.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'finq_db.g.dart';

class Transactions extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get description => text()();
  TextColumn get categoryType => text()();
  RealColumn get amount => real().nullable()();
  DateTimeColumn get transactionDate => dateTime()();
  IntColumn get transactionType => intEnum<TransactionType>()();

  @override
  String toString() {
    return 'Trasaction{id:$id,amount:$amount,desc:$description}';
  }
}


@LazySingleton()
@UseMoor(tables: [
  Transactions
], daos: [
  TransactionsDao
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
}
