import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/domain/entities/date_range_params.dart';
import 'package:finq/domain/entities/total_amount_entity.dart';
import 'package:finq/domain/usecases/use_case_imports.dart';
import 'package:flutter/material.dart';

part 'total_amount_event.dart';
part 'total_amount_state.dart';

class TotalAmountCubit extends Cubit<TotalAmountState> {
  final GetTotalTransactionAmount getTotalTransactionAmount;
  TotalAmountCubit({required this.getTotalTransactionAmount})
      : super(TotalAmountInitial());

  void watchTotalAmount(LoadTotalAmount loadTotalAmount) {
    getTotalTransactionAmount(DateRangeParams(
            startDate: loadTotalAmount.dateTimeRange.start,
            endDate: loadTotalAmount.dateTimeRange.end))
        .listen((event) {
      emit(event.fold((l) => TotalAmountLoadErrorState(message: ''), (r) {
        debugPrint('LoadTotalAmount ${r.totalExpenseAmount}');
        return TotalAmountLoadedState(totalAmountEntity: r);
      }));
    });
  }
}

// class TotalAmountBloc extends Bloc<TotalAmountEvent, TotalAmountState> {
//   final GetTotalTransactionAmount getTotalTransactionAmount;

//   TotalAmountBloc({required this.getTotalTransactionAmount})
//       : super(TotalAmountInitial());

//   @override
//   Stream<TotalAmountState> mapEventToState(
//     TotalAmountEvent event,
//   ) async* {
//     if (event is LoadTotalAmount) {
//       debugPrint('LoadTotalAmount');
//       getTotalTransactionAmount(DateRangeParams(
//               startDate: event.dateTimeRange.start,
//               endDate: event.dateTimeRange.end))
//           .listen((event) {
//         emit(event.fold((l) => TotalAmountLoadErrorState(message: ''), (r) {
//           debugPrint('LoadTotalAmount ${r.totalExpenseAmount}');
//           return TotalAmountLoadedState(totalAmountEntity: r);
//         }));
//       });

//     }
//   }
// }
