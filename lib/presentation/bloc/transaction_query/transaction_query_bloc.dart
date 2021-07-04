import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaction_query_event.dart';
part 'transaction_query_state.dart';

class TransactionQueryBloc extends Bloc<TransactionQueryEvent, TransactionQueryState> {
  TransactionQueryBloc() : super(TransactionQueryInitial());

  @override
  Stream<TransactionQueryState> mapEventToState(
    TransactionQueryEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
