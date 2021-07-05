import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:finq/presentation/models/field_errors.dart';
import 'package:finq/presentation/utils/transaction_entry_validation_mixin.dart';

part 'transaction_entry_validation_event.dart';
part 'transaction_entry_validation_state.dart';

class TransactionEntryValidationBloc
    extends Bloc<TransactionEntryValidationEvent, TransitionEntryValidateState>
    with TransactionEntryValidationMixin {
  TransactionEntryValidationBloc() : super(TransactionEntryValidInitialState());

  @override
  Stream<TransitionEntryValidateState> mapEventToState(
    TransactionEntryValidationEvent event,
  ) async* {
    if (event is TransactionEntryValidationSubmit) {
      if (!this.isInputValid(event.amount)) {
        yield TransactionEntryValidationError(FieldError.InvalidAmount);
        return;
      }

      if (!this.isDescriptionValid(event.description)) {
        yield TransactionEntryValidationError(FieldError.InvalidDescription);
        return;
      }
      if (!this.isCategoryValid(event.categoryName)) {
        yield TransactionEntryValidationError(FieldError.InvalidDescription);
        return;
      }
      yield TransitionEntryValidateSuccess(
          amount: double.parse(event.amount),
          categoryName: event.categoryName!,
          desc: event.description,
          transactionDate: event.selectedDate
          );
    }
  }
}
