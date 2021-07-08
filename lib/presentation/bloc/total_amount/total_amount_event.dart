part of 'total_amount_bloc.dart';

abstract class TotalAmountEvent extends Equatable {
  const TotalAmountEvent();

  @override
  List<Object> get props => [];
}

class LoadTotalAmount extends TotalAmountEvent {
  final DateTime startDate;
  final DateTime endDate;
  LoadTotalAmount({required this.startDate, required this.endDate}) : super();

  @override
  List<Object> get props => [startDate, endDate];
}

