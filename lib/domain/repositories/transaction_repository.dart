import 'package:dartz/dartz.dart';
import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/entities/total_amount_entity.dart';
import 'package:finq/domain/entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<Either<AppError, void>> insertTransaction(
      TransactionEntity transaction);

  Future<Either<AppError, void>> updateTransaction(
      TransactionEntity transaction);
  Future<Either<AppError, void>> deleteTransaction(int id);
  Stream<Either<AppError, TotalAmountEntity>> watchTotalAmount(
      DateTime startDate, DateTime endDate);

  
  Future<Either<AppError, List<TransactionEntity>>>
      getTransactionsByRangeAndFilter(
          TransactionType type, DateTime startDate, DateTime endDate);

  Stream<Either<AppError, List<TransactionEntity>>>
      getAllTransactionBetweenRange(DateTime startDate, DateTime endDate);
}
