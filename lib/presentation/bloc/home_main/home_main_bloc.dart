import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/bloc/home_chart_data/home_chart_data_bloc.dart';

part 'home_main_event.dart';
part 'home_main_state.dart';

class HomeMainBloc extends Bloc<HomeMainEvent, HomeMainState> {
  final TotalAmountBloc totalAmountBloc;
  final HomeChartDataBloc homeChartDataBloc;
  HomeMainBloc({required this.homeChartDataBloc, required this.totalAmountBloc})
      : super(HomeMainInitial());

  @override
  Stream<HomeMainState> mapEventToState(
    HomeMainEvent event,
  ) async* {
    if (event is LoadHomeInitialData) {
      totalAmountBloc.add(LoadTotalAmount(
          startDate: DateTime(DateTime.now().year, DateTime.now().month),
          endDate: DateTime(DateTime.now().year, DateTime.now().month + 1)));

      homeChartDataBloc.add(HomeChartDataLoadEvent(
          startDate: DateTime(DateTime.now().year, DateTime.now().month),
          endDate: DateTime(DateTime.now().year, DateTime.now().month + 1),
          type: TransactionType.INCOME));
    }
  }
}
