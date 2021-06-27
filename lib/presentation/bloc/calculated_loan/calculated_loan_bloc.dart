import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/domain/entities/calculated_loan_entity.dart';
import 'package:finq/domain/entities/loanParam.dart';
import 'package:finq/domain/usecases/loan_calculator/get_calculate_loan.dart';

part 'calculated_loan_event.dart';
part 'calculated_loan_state.dart';

class CalculatedLoanBloc
    extends Bloc<CalculatedLoanEvent, CalculatedLoanState> {
  final GetCalculatedLoan calculate;
  CalculatedLoanBloc(this.calculate) : super(CalculatedLoanInitial());

  @override
  Stream<CalculatedLoanState> mapEventToState(
    CalculatedLoanEvent event,
  ) async* {
    if (event is CalculatePressed) {
      final result = await calculate(LoanParams(event.p, event.i, event.y));
      yield result.fold((l) => CalculatedLoanError(l.message),
          (r) => CalculatedLoanSuccess(r));
    }
  }
}
