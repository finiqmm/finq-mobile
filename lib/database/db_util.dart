import 'dart:io';

import 'package:finq/database/finq_db.dart';
import 'package:finq/database/transactions_dao.dart';
import 'package:finq/di/injectable.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

@singleton
class DbUtil {
  FinqDb get finqDb => FinqDb.getInstance();

  TransactionsDao get transactionDao => TransactionsDao(finqDb);

  Future<String> backUpDatabase() async {
    final dbFolder = await getDatabasesPath();
    final dbLocation = p.join(dbFolder, 'db.sqlite');
    final File file = File(dbLocation);
    return file.path;
  }

  Future<void> restoreDatabase(Function(File) io) async {
    await closeDb();
    final dbFolder = await getDatabasesPath();
    final dbLocation = p.join(dbFolder, 'db.sqlite');
    final File file = File(dbLocation);
    io(file);
    finqDb.toString();
  }

  Future<void> closeDb() async {
    await finqDb.close();
  }
}
