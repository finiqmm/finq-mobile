import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/entities/calculated_loan_entity.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/repositories/loan_calculator_repository.dart';
import 'package:finq/domain/usecases/use_case.dart';

class GetCalculatedLoan extends UseCase<CalculatedLoanEntity, NoParams> {
  final LoanCalculatorRepository loanCalculatorRepository;

  GetCalculatedLoan(this.loanCalculatorRepository);

  @override
  Future<Either<AppError, CalculatedLoanEntity>> call(NoParams params) {
    return loanCalculatorRepository.getCalculatedLoan();
  }
}
