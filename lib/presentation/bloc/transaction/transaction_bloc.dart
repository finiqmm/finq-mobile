import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/domain/entities/transaction_entity.dart';
import 'package:finq/domain/usecases/transactions/insert_transaction.dart';
import 'package:finq/domain/usecases/use_case_imports.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final InsertTransaction insertTransaction;
  final UpdateTransaction updateTransaction;
  TransactionBloc(
      {required this.insertTransaction, required this.updateTransaction})
      : super(TransactionInitial());

  @override
  Stream<TransactionState> mapEventToState(
    TransactionEvent event,
  ) async* {
    if (event is NewTransactionInsertEvent) {
      final result = await insertTransaction(event.transactionEntity);
      yield result.fold(
          (l) => TransactionError(l.message), (r) => InsertSuccess());
    }
  }
}
