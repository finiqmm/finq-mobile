import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/domain/entities/date_range_params.dart';
import 'package:finq/domain/entities/total_amount_entity.dart';
import 'package:finq/domain/usecases/use_case_imports.dart';
import 'package:flutter/material.dart';

part 'total_amount_event.dart';
part 'total_amount_state.dart';

class TotalAmountBloc extends Bloc<TotalAmountEvent, TotalAmountState> {
  final GetTotalTransactionAmount getTotalTransactionAmount;

  TotalAmountBloc({required this.getTotalTransactionAmount})
      : super(TotalAmountInitial());

  @override
  Stream<TotalAmountState> mapEventToState(
    TotalAmountEvent event,
  ) async* {
    if (event is LoadTotalAmount) {
      final result = getTotalTransactionAmount(
          DateRangeParams(startDate: event.startDate, endDate: event.endDate));
      yield* result.map((event) =>
          event.fold((l) => TotalAmountLoadErrorState(message: ''), (r) {
            debugPrint('HellAm ${r.totalExpenseAmount}');
            return TotalAmountLoadedState(totalAmountEntity: r);
          }));
    }
  }
}
