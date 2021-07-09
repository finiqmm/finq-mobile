part of 'home_chart_data_bloc.dart';

abstract class HomeChartDataEvent extends Equatable {
  const HomeChartDataEvent();

  @override
  List<Object> get props => [];
}

class HomeChartDataLoadEvent extends HomeChartDataEvent {
  final DateTime startDate;
  final DateTime endDate;
  final TransactionType type;

  HomeChartDataLoadEvent(
      {required this.startDate, required this.endDate, required this.type})
      : super();
}
