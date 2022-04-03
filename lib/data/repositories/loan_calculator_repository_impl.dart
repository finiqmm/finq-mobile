import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:finq/data/data_sources/loan_calculator_data_source.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/entities/calculated_loan_entity.dart';
import 'package:finq/domain/repositories/loan_calculator_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LoanCalculatorRepository)
class LoanCalculatorRepositoryImpl extends LoanCalculatorRepository {
  final LoanCalculatorDataSource loanCalculatorDataSource;

  LoanCalculatorRepositoryImpl(this.loanCalculatorDataSource);

  @override
  Future<Either<AppError, CalculatedLoanEntity>> getCalculatedLoan(
      double p, double i, double y) {
    try {
      return Future.value(
          Right(loanCalculatorDataSource.getCalculatedLoan(p, i, y)));
    } on FormatException {
      return Future.value(
          Left(AppError(AppErrorType.unauthorised, "Can't sign in")));
    }
  }
}
