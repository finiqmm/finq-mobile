import 'package:finq/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/date_range_params.dart';
import 'package:finq/domain/entities/transaction_entity.dart';
import 'package:finq/domain/repositories/transaction_repository.dart';
import 'package:finq/domain/usecases/use_case.dart';

class GetAllTransactionBetweenRange
    extends StreamUseCase<List<TransactionEntity>, DateRangeParams> {
  final TransactionRepository transactionRepository;

  GetAllTransactionBetweenRange(this.transactionRepository);

  @override
  Stream<Either<AppError, List<TransactionEntity>>> call(DateRangeParams params) {
    return transactionRepository.getAllTransactionBetweenRange(params.startDate, params.endDate);
  }

 
}
