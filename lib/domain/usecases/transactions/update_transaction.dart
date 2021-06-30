import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/entities/transaction_entity.dart';
import 'package:finq/domain/repositories/transaction_repository.dart';

import '../use_case.dart';

class UpdateTransaction extends UseCase<void, TransactionEntity> {
  final TransactionRepository transactionRepository;

  UpdateTransaction({required this.transactionRepository});
  @override
  Future<Either<AppError, void>> call(TransactionEntity params) {
    return transactionRepository.insertTransaction(params);
  }
}
