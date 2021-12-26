import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/domain/entities/transaction_type_params.dart';
import 'package:finq/domain/usecases/transactions/get_all_transaction_by_filter_range.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/mapper/transaction_chart_ui_model_mapper.dart';
import 'package:finq/presentation/models/transaction_ui_chart_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'home_chart_data_event.dart';
part 'home_chart_data_state.dart';

@injectable
class HomeChartDataBloc extends Bloc<HomeChartDataEvent, HomeChartDataState> {
  final TransactionChartUiModelMapper mapper;
  final GetAllTransactionByFilterRange getAllTransactionByFilterRange;

  HomeChartDataBloc(
      {required this.getAllTransactionByFilterRange, required this.mapper})
      : super(HomeChartDataInitial()) {
    on<HomeChartDataLoadEvent>((event, emit) async {
      emit(HomeChartDataLoading());
      final response = await getAllTransactionByFilterRange(
          TransactionTypeParams(
              event.type, event.dateTimeRange.start, event.dateTimeRange.end));
      emit(response.fold((l) => HomeChartDataEmpty(), (r) {
        if (r.isNotEmpty) {
          return HomeChartDataLoaded(chartItems: mapper.from(r));
        } else {
          return HomeChartDataEmpty();
        }
      }));
    });
  }

  // @override
  // Stream<HomeChartDataState> mapEventToState(HomeChartDataEvent event) async* {
  //   if (event is HomeChartDataLoadEvent) {
  //     yield* _mapHomeChartDataLoadedToState(event);
  //   }
  // }

  // Stream<HomeChartDataState> _mapHomeChartDataLoadedToState(
  //     HomeChartDataLoadEvent event) async* {
  //   yield HomeChartDataLoading();

  //   final response = await getAllTransactionByFilterRange(TransactionTypeParams(
  //       event.type, event.dateTimeRange.start, event.dateTimeRange.end));
  //   yield response.fold((l) => HomeChartDataEmpty(), (r) {
  //     if (r.isNotEmpty) {
  //       return HomeChartDataLoaded(chartItems: mapper.from(r));
  //     } else {
  //       return HomeChartDataEmpty();
  //     }
  //   });
  // }
}
