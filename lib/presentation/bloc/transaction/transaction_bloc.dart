import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/domain/entities/date_range_params.dart';
import 'package:finq/domain/entities/transaction_entity.dart';
import 'package:finq/domain/entities/transaction_type_params.dart';
import 'package:finq/domain/usecases/transactions/get_total_transaction_amount.dart';
import 'package:finq/domain/usecases/transactions/insert_transaction.dart';
import 'package:finq/domain/usecases/use_case_imports.dart';
import 'package:finq/presentation/mapper/transaction_chart_ui_model_mapper.dart';
import 'package:finq/presentation/mapper/transaction_ui_model_mapper.dart';
import 'package:finq/presentation/models/transaction_ui_model.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final InsertTransaction insertTransaction;
  final UpdateTransaction updateTransaction;
  // final GetTotalTransactionType getTotalTransactionType;
  final GetAllTransactionBetweenRange getAllTransactionBetweenRange;
  final GetAllTransactionByFilterRange getAllTransactionByFilterRange;
  final TransactionUiModelMapper mapper;
  final TransactionChartUiModelMapper transactionChartUiModelMapper;
  TransactionBloc(this.mapper, this.transactionChartUiModelMapper,
      {required this.insertTransaction,
      required this.updateTransaction,
      // required this.getTotalTransactionType,
      required this.getAllTransactionBetweenRange,
      required this.getAllTransactionByFilterRange})
      : super(TransactionInitial());

  @override
  Stream<TransactionState> mapEventToState(
    TransactionEvent event,
  ) async* {
    // if (event is NewTransactionInsertEvent) {
    //   final result = await insertTransaction(event.transactionEntity);
    //   yield result.fold(
    //       (l) => TransactionError(l.message), (r) => InsertSuccess());
    // }

    // if (event is GetTotalIncomeEvent) {
    //   final result = await getTotalTransactionType(TransactionTypeParams(
    //       TransactionType.INCOME, event.startDate, event.endDate));
    //   yield result.fold(
    //       (l) => TransactionError(l.message), (r) => TotalIncomeAmountState(r));
    // }
    // if (event is GetTotalExpenseEvent) {
    //   final result = await getTotalTransactionType(TransactionTypeParams(
    //       TransactionType.EXPENSE, event.startDate, event.endDate));
    //   yield result.fold((l) => TransactionError(l.message),
    //       (r) => TotalExpenseAmountState(r));
    // }
    // if (event is GetTotalExpenseEvent) {
    //   final result = await getTotalTransactionType(TransactionTypeParams(
    //       TransactionType.EXPENSE, event.startDate, event.endDate));
    //   yield result.fold((l) => TransactionError(l.message),
    //       (r) => TotalExpenseAmountState(r));
    // }
    // if (event is LoadHomeScreenChartData) {
    //   debugPrint('LoadHomeScreenChartData');
    //   yield HomeChartDataLoadingState();

    //   final result = await getAllTransactionByFilterRange(
    //       TransactionTypeParams(event.type, event.startDate, event.endDate));
    //   yield result.fold((l) => TransactionError(l.message), (r) {
    //     debugPrint('BlocTrans' + r.length.toString() + "fewf");
    //     return HomeChartDataLoadedState(
    //         new List.from(transactionChartUiModelMapper.from(r)),
    //         DateTime.now().millisecondsSinceEpoch);
    //   });
    // }

    if (event is LoadTransactionBetweenRange) {
      // emit(getAllTransactionBetweenRange(DateRangeParams(
      //         startDate: event.startDate, endDate: event.endDate))
      //     .map((event) => event.fold((l) => TransactionError(l.message), (r) {
      //           final uiModel = mapper.from(r);
      //           return TransactionListLoadedState(uiModel);
      //         })));
      yield* getAllTransactionBetweenRange(DateRangeParams(
              startDate: event.startDate, endDate: event.endDate))
          .map((event) => event.fold((l) => TransactionError(l.message), (r) {
                final uiModel = mapper.from(r);
                return TransactionListLoadedState(uiModel);
              }));
    }

    // if (event is GetTotalAmountTransactionEvent) {
    //   debugPrint('fweejig ${event.transactionType}');
    //   final result = await getTotalTransactionType(TransactionTypeParams(
    //       event.transactionType, event.startDate, event.endDate));
    //   yield result.fold((l) => TransactionError(l.message), (r) {
    //     if (event.transactionType == TransactionType.INCOME) {
    //       return TotalIncomeAmountState(r);
    //     }
    //     return TotalExpenseAmountState(r);
    //   });
    // }
  }
}
