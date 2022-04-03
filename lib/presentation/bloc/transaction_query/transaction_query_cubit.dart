
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/domain/entities/date_range_params.dart';
import 'package:finq/domain/usecases/use_case_imports.dart';
import 'package:finq/presentation/mapper/transaction_ui_model_mapper.dart';
import 'package:finq/presentation/models/transaction_ui_list_filter.dart';
import 'package:finq/presentation/models/transaction_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'transaction_query_state.dart';


class LoadHomeTransactionList extends Equatable {
  final TransactionUiListFilter listFilter;
  final DateTimeRange dateTimeRange;

  LoadHomeTransactionList(
      {this.listFilter = TransactionUiListFilter.DAILY,
      required this.dateTimeRange});

  @override
  List<Object> get props => [listFilter, dateTimeRange];
}

@injectable
class TransactionQueryCubit extends Cubit<TransactionQueryState> {
  TransactionQueryCubit(
      {required this.getAllTransactionBetweenRange, required this.mapper})
      : super(TransactionQueryInitial());
  final GetAllTransactionBetweenRange getAllTransactionBetweenRange;
  final TransactionUiModelMapper mapper;

  void watchHomeTransactionList(LoadHomeTransactionList event) async {
    emit(TransactionQueryLoading());
    getAllTransactionBetweenRange(DateRangeParams(
            startDate: event.dateTimeRange.start,
            endDate: event.dateTimeRange.end))
        .listen((result) {
      emit(result.fold(
          (l) => TransactionQueryError(l.message),
          (r) => TransactionListQueryLoadedState(
              mapper.from(r, event.listFilter))));
    });
  }
}
