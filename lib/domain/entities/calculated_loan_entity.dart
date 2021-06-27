import 'package:equatable/equatable.dart';

class CalculatedLoanEntity extends Equatable {
  final double emi;
  final double interestTotal;

  CalculatedLoanEntity({required this.emi, required this.interestTotal});

  @override
  List<Object?> get props => [emi, interestTotal];

  @override
  String toString() {
    return 'User $emi//$interestTotal';
  }
}
