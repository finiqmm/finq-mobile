part of 'home_chart_data_bloc.dart';

abstract class HomeChartDataEvent extends Equatable {
  const HomeChartDataEvent();

  @override
  List<Object> get props => [];
}

class HomeChartDataLoadEvent extends HomeChartDataEvent {
  final DateTimeRange dateTimeRange;
  final TransactionType type;

  HomeChartDataLoadEvent(
      {required this.dateTimeRange, required this.type})
      : super();
}
