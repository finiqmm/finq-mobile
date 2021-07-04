import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/data/data_sources/transaction_data_source.dart';
import 'package:finq/data/mapper/transaction_entity_mapper.dart';
import 'package:finq/domain/entities/transaction_entity.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:finq/domain/repositories/transaction_repository.dart';

class TransactionRepoImpl extends TransactionRepository {
  final TransactionDataSource transactionDataSource;
  final TransactionEntityMapper mapper;

  TransactionRepoImpl(this.transactionDataSource, this.mapper);
  @override
  Future<Either<AppError, void>> insertTransaction(
      TransactionEntity transactionEntity) async {
    try {
      final result = await transactionDataSource
          .insertNewTransaction(mapper.from(transactionEntity));
      return Right(result);
    } on Exception {
      return Left(AppError(AppErrorType.database, 'Error inserting into db'));
    }
  }

  @override
  Future<Either<AppError, void>> updateTransaction(
      TransactionEntity transaction) async {
    try {
      return Right(Future.delayed(Duration(milliseconds: 2)));

      // final result = await transactionDataSource
      //     .insertNewTransaction(Transaction.fromTransactionEntity(transaction));
      // return Right(result);

    } on Exception {
      return Left(AppError(AppErrorType.database, 'Error inserting into db'));
    }
  }

  @override
  Future<Either<AppError, double>> getTotalAmountOfTransactionType(
      TransactionType type, DateTime startDate, DateTime endDate) async {
    try {
      final result = await transactionDataSource.getTotalAmountOfType(
          type, startDate, endDate);
      return Right(result ?? 0);
    } on Exception {
      return Left(AppError(AppErrorType.database, 'Error'));
    }
  }

  @override
  Stream<Either<AppError, List<TransactionEntity>>>
      getAllTransactionBetweenRange(DateTime startDate, DateTime endDate) {
    return transactionDataSource
        .getAllTransactionBetweenRange(startDate, endDate)
        .handleError((error) => Left(AppError(AppErrorType.database, '')))
        .map((transactionList) =>
            Right(transactionList.map((e) => mapper.to(e)).toList()));
    // try {
    //   return transactionDataSource
    //       .getAllTransactionBetweenRange(startDate, endDate)
    //       .handleError((error)  =>Left(AppError(AppErrorType.database, '')) )

    //       .map((transactionList) =>
    //           Right(transactionList.map((e) => mapper.to(e)).toList()));
    // } on Exception {
    //   return Stream.value(Left(AppError(AppErrorType.database, '')));
    // }
  }

  @override
  Future<Either<AppError, List<TransactionEntity>>>
      getTransactionsByRangeAndFilter(
          TransactionType type, DateTime startDate, DateTime endDate) async {
    try {
      final result = await transactionDataSource.getTransactionListByTypeFilter(
          type, startDate, endDate);
      return Right(result.map((e) => mapper.to(e)).toList());
    } on Exception {
      return Left(AppError(AppErrorType.database, ''));
    }
  }
}
