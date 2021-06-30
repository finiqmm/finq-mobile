import 'package:finq/data/data_sources/transaction_data_source.dart';
import 'package:finq/data/tables/transaction.dart';
import 'package:finq/domain/entities/transaction_entity.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:finq/domain/repositories/transaction_repository.dart';

class TransactionRepoImpl extends TransactionRepository {
  final TransactionDataSource transactionDataSource;

  TransactionRepoImpl(this.transactionDataSource);
  @override
  Future<Either<AppError, void>> insertTransaction(
      TransactionEntity transactionEntity) async {
    try {
      final result = await transactionDataSource.insertNewTransaction(
          Transaction.fromTransactionEntity(transactionEntity));
      return Right(result);
    } on Exception {
      return Left(AppError(AppErrorType.database, 'Error inserting into db'));
    }
  }

  @override
  Future<Either<AppError, void>> updateTransaction(TransactionEntity transaction)async {
    try {
      final result = await transactionDataSource.insertNewTransaction(
          Transaction.fromTransactionEntity(transaction));
      return Right(result);
    } on Exception {
      return Left(AppError(AppErrorType.database, 'Error inserting into db'));
    }
  }
}
