import 'package:equatable/equatable.dart';

class TotalAmountEntity extends Equatable{
  final double totalIncomeAmount;
  final double totalExpenseAmount;

  TotalAmountEntity(
      {required this.totalIncomeAmount, required this.totalExpenseAmount});

      @override
  List<Object?> get props => [totalExpenseAmount,totalIncomeAmount];
}
