import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/date_range_params.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/entities/total_amount_entity.dart';
import 'package:finq/domain/repositories/transaction_repository.dart';
import 'package:finq/domain/usecases/use_case.dart';

class GetTotalTransactionAmount
    extends StreamUseCase<TotalAmountEntity, DateRangeParams> {
  final TransactionRepository repository;

  GetTotalTransactionAmount(this.repository);

  @override
  Stream<Either<AppError, TotalAmountEntity>> call(DateRangeParams params) {
    return repository.watchTotalAmount(params.startDate, params.endDate);
  }
}
