import 'dart:async';

import 'package:finq/data/tables/transaction.dart';
import 'package:finq/database/transaction_dao.dart';
import 'package:finq/database/type_converters.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';

part 'finq_db.g.dart';

@TypeConverters([DateTimeConverter, TransactionTypeConverter])
@Database(version: 1, entities: [Transaction])
abstract class FinqDb extends FloorDatabase {
  TransactionDao get transactionDao;
}
