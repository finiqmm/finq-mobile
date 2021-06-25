import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/repositories/loan_calculator_repository.dart';
import 'package:finq/domain/usecases/use_case.dart';

class Calculate extends UseCase<void, NoParams> {
  final LoanCalculatorRepository loanCalculatorRepo;

  Calculate({required this.loanCalculatorRepo});
  @override
  Future<Either<AppError, void>> call(NoParams params) async {
    return await loanCalculatorRepo.getCalculatedLoan();
  }
}
