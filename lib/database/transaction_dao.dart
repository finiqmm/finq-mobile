import 'package:finq/data/tables/transaction.dart';
import 'package:floor/floor.dart';

@dao
abstract class TransactionDao {
  @insert
  Future<void> insertTransaction(Transaction transaction);

  @update
  Future<void> updateTransaction(Transaction transaction);
}
