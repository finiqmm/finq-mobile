import 'package:finq/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/transaction_entity.dart';
import 'package:finq/domain/repositories/transaction_repository.dart';
import 'package:finq/domain/usecases/use_case.dart';

class InsertTransaction extends UseCase<void, TransactionEntity> {
  final TransactionRepository transactionRepository;

  InsertTransaction({required this.transactionRepository});
  @override
  Future<Either<AppError, void>> call(TransactionEntity params) {
    return transactionRepository.insertTransaction(params);
  }
}
