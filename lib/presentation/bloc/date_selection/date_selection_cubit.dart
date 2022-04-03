import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/common/constants/money_formatter.dart';
import 'package:finq/presentation/models/transaction_ui_list_filter.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'date_selection_state.dart';

@injectable
class DateSelectionCubit extends Cubit<DateSelectionState> {
  DateSelectionCubit()
      : super(DateSelectionState.initalState());

  void changeDateRange(DateTimeRange selectedRange) {
   emit(DateSelectionState.initalState().copy(selectedRange, null));
  }

  void changeListFilter(TransactionUiListFilter listFilter) {
    emit(DateSelectionState.initalState().copy(null, listFilter));
  }

  void changeDateSelectionState(String value) {
    final a = DateSelectionState(
        listFilter: getFilterEnum(value),
        currentDateRange: getDateTimeRange(value));
    emit(a);
    //  dropdownValue = getFilterEnum(value);
    //   currentDateRange = getDateTimeRange(value);
  }
}
