part of 'calculated_loan_bloc.dart';

abstract class CalculatedLoanEvent extends Equatable {
  const CalculatedLoanEvent();

  @override
  List<Object> get props => [];
}

class CalculatePressed extends CalculatedLoanEvent {
  final double p;
  final double i;
  final double y;

  CalculatePressed(this.p, this.i, this.y);
}
