import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/usecases/loan_calculator/calculate.dart';

part 'calculated_loan_event.dart';
part 'calculated_loan_state.dart';

class CalculatedLoanBloc
    extends Bloc<CalculatedLoanEvent, CalculatedLoanState> {
  final Calculate calculate;
  CalculatedLoanBloc(this.calculate) : super(CalculatedLoanInitial());

  @override
  Stream<CalculatedLoanState> mapEventToState(
    CalculatedLoanEvent event,
  ) async* {
    if (event is CalculatePressed) {
      final result = await calculate(NoParams());
      yield result.fold((l) => CalculatedLoanError(l.message),
          (r) => CalculatedLoanSuccess());
    }
  }
}
