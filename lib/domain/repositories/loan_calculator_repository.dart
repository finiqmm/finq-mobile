import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/entities/calculated_loan_entity.dart';

abstract class LoanCalculatorRepository {
  Future<Either<AppError, CalculatedLoanEntity>> getCalculatedLoan(
      double p, double i, double y);
}
