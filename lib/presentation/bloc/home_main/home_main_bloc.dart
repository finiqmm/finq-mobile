import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/common/constants/money_formatter.dart';
import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/bloc/home_chart_data/home_chart_data_bloc.dart';
import 'package:injectable/injectable.dart';

part 'home_main_event.dart';
part 'home_main_state.dart';

@injectable
class HomeMainBloc extends Bloc<HomeMainEvent, HomeMainState> {
  final TotalAmountCubit totalAmountBloc;
  final HomeChartDataBloc homeChartDataBloc;
  final TransactionQueryCubit transactionQueryBloc;
  HomeMainBloc(
      {required this.homeChartDataBloc,
      required this.totalAmountBloc,
      required this.transactionQueryBloc})
      : super(HomeMainInitial()) {
    on<LoadHomeInitialData>((event, emit) {
       totalAmountBloc.watchTotalAmount(LoadTotalAmount(
          dateTimeRange: FinQDateUtil.getCurrentMonthDateRange()));

      homeChartDataBloc.add(HomeChartDataLoadEvent(
          dateTimeRange: FinQDateUtil.getCurrentMonthDateRange(),
          type: TransactionType.INCOME));
      transactionQueryBloc.watchHomeTransactionList(LoadHomeTransactionList(
          dateTimeRange: FinQDateUtil.getCurrentMonthDateRange()));
    });
  }

  // @override
  // Stream<HomeMainState> mapEventToState(
  //   HomeMainEvent event,
  // ) async* {
  //   if (event is LoadHomeInitialData) {
  //     totalAmountBloc.watchTotalAmount(LoadTotalAmount(
  //         dateTimeRange: FinQDateUtil.getCurrentMonthDateRange()));

  //     homeChartDataBloc.add(HomeChartDataLoadEvent(
  //         dateTimeRange: FinQDateUtil.getCurrentMonthDateRange(),
  //         type: TransactionType.INCOME));
  //     transactionQueryBloc.watchHomeTransactionList(LoadHomeTransactionList(
  //         dateTimeRange: FinQDateUtil.getCurrentMonthDateRange()));
  //   }
  // }
}
