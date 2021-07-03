import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/entities/transaction_type_params.dart';
import 'package:finq/domain/repositories/transaction_repository.dart';
import 'package:finq/domain/usecases/use_case.dart';

class GetTotalTransactionType extends UseCase<double, TransactionTypeParams> {
  final TransactionRepository repository;

  GetTotalTransactionType(this.repository);

  @override
  Future<Either<AppError, double>> call(TransactionTypeParams params) {
    return repository.getTotalAmountOfTransactionType(
        params.type, params.startDate, params.endDate);
  }
}
