part of 'calculated_loan_bloc.dart';

abstract class CalculatedLoanState extends Equatable {
  const CalculatedLoanState();

  @override
  List<Object> get props => [];
}

class CalculatedLoanInitial extends CalculatedLoanState {}

class CalculatedLoanError extends CalculatedLoanState {
  final String message;

  CalculatedLoanError(this.message);
}

class CalculatedLoanSuccess extends CalculatedLoanState {}
