import 'package:finq/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/transaction_entity.dart';
import 'package:finq/domain/entities/transaction_type_params.dart';
import 'package:finq/domain/repositories/transaction_repository.dart';
import 'package:finq/domain/usecases/use_case.dart';

class GetAllTransactionByFilterRange
    extends UseCase<List<TransactionEntity>, TransactionTypeParams> {
  final TransactionRepository transactionRepository;

  GetAllTransactionByFilterRange(this.transactionRepository);
  @override
  Future<Either<AppError, List<TransactionEntity>>> call(
      TransactionTypeParams params) {
    return transactionRepository.getTransactionsByRangeAndFilter(
        params.type, params.startDate, params.endDate);
  }
}
