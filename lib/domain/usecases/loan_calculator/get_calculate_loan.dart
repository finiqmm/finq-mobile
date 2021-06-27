import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/entities/calculated_loan_entity.dart';
import 'package:finq/domain/entities/loanParam.dart';
import 'package:finq/domain/repositories/loan_calculator_repository.dart';
import 'package:finq/domain/usecases/use_case.dart';

class GetCalculatedLoan extends UseCase<CalculatedLoanEntity, LoanParams> {
  final LoanCalculatorRepository loanCalculatorRepository;

  GetCalculatedLoan(this.loanCalculatorRepository);

  @override
  Future<Either<AppError, CalculatedLoanEntity>> call(LoanParams params) {
    return loanCalculatorRepository.getCalculatedLoan(
        params.p, params.i, params.y);
  }
}
