import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:finq/presentation/models/field_errors.dart';
import 'package:finq/presentation/utils/transaction_entry_validation_mixin.dart';
import 'package:injectable/injectable.dart';

part 'transaction_entry_validation_event.dart';
part 'transaction_entry_validation_state.dart';

@injectable
class TransactionEntryValidationBloc
    extends Bloc<TransactionEntryValidationEvent, TransitionEntryValidateState>
    with TransactionEntryValidationMixin {
  TransactionEntryValidationBloc()
      : super(TransactionEntryValidInitialState()) {
    on<TransactionEntryValidationSubmit>((event, emit) {
      if (!this.isInputValid(event.amount)) {
        emit(TransactionEntryValidationError(FieldError.InvalidAmount));
        return;
      }

      if (!this.isDescriptionValid(event.description)) {
        emit(TransactionEntryValidationError(FieldError.InvalidDescription));
        return;
      }
      if (!this.isCategoryValid(event.categoryName)) {
        emit(TransactionEntryValidationError(FieldError.InvalidDescription));
        return;
      }

      emit(TransitionEntryValidateSuccess(
          amount: double.parse(event.amount),
          categoryName: event.categoryName!,
          desc: event.description,
          transactionDate: event.selectedDate));
    });
  }
  
}
