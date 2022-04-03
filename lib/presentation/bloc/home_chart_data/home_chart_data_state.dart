part of 'home_chart_data_bloc.dart';

abstract class HomeChartDataState extends Equatable {
  const HomeChartDataState();

  @override
  List<Object> get props => [];
}

class HomeChartDataInitial extends HomeChartDataState {}

class HomeChartDataLoading extends HomeChartDataState {
  HomeChartDataLoading() : super();
}

class HomeChartDataLoaded extends HomeChartDataState {
  final List<TransactionChartUiModel> chartItems;

  HomeChartDataLoaded({required this.chartItems}) : super();
}

class HomeChartDataEmpty extends HomeChartDataState {
  HomeChartDataEmpty() : super();
}
