import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/database/transactions_dao.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

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

@DriftDatabase(tables: [
  Transactions
], daos: [
  TransactionsDao
], queries: {
  "sumofTransactionAmount":
      "SELECT SUM(amount) FROM transactions WHERE transaction_date>=:startDate AND transaction_date<=:endDate AND transaction_type=:transType"
})
class FinqDb extends _$FinqDb {
  FinqDb._internal() : super(_openConnection());
  static FinqDb? _instance;
  // factory FinqDb() => _instance;

  static FinqDb getInstance() {
    if (_instance == null) {
      _instance = FinqDb._internal();
    }
    return _instance!;
  }

  @override
  Future<void> close() {
    _instance = null;
    return super.close();
  }

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getDatabasesPath();
    // print('Hello -> ${dbFolder.path} -- ${dbFolder.exists()}');
    final file = File(p.join(dbFolder, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
