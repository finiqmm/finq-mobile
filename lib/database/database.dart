import 'package:finq/common/constants/transaction_type.dart';
import 'package:moor_flutter/moor_flutter.dart';

part "database.g.dart";

class Transaction extends Table {
  IntColumn get id => integer().autoIncrement()();
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

@UseMoor(tables: [Transaction])
class Database extends _$Database{
  Database() : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));
  
  @override
  int get schemaVersion => 1;
}
