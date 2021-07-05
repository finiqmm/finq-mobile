import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/entities/transaction_entity.dart';
import 'package:finq/domain/repositories/transaction_repository.dart';

import '../use_case.dart';

class DeleteTransaction extends UseCase<void, int> {
  final TransactionRepository transactionRepository;

  DeleteTransaction({required this.transactionRepository});
  @override
  Future<Either<AppError, void>> call(int params) {
    return transactionRepository.deleteTransaction(params);
  }
}
