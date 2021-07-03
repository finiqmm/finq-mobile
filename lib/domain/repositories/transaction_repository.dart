import 'package:dartz/dartz.dart';
import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<Either<AppError, void>> insertTransaction(
      TransactionEntity transaction);

  Future<Either<AppError, void>> updateTransaction(
      TransactionEntity transaction);

  Future<Either<AppError, double>> getTotalAmountOfTransactionType(
      TransactionType type, DateTime startDate, DateTime endDate);
}
