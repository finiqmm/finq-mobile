part of 'total_amount_cubit.dart';

abstract class TotalAmountEvent extends Equatable {
  const TotalAmountEvent();

  @override
  List<Object> get props => [];
}

class LoadTotalAmount extends TotalAmountEvent {
  final DateTimeRange dateTimeRange;
  LoadTotalAmount({required this.dateTimeRange}) : super();

  @override
  List<Object> get props => [dateTimeRange];
}
