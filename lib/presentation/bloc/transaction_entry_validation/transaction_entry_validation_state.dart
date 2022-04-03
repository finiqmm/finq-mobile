part of 'transaction_entry_validation_bloc.dart';

abstract class TransitionEntryValidateState {}

class TransactionEntryValidInitialState extends TransitionEntryValidateState {}

class TransitionEntryValidateSuccess extends TransitionEntryValidateState {
  final String desc;
  final double amount;
  final String categoryName;
  final DateTime transactionDate;

  TransitionEntryValidateSuccess(
      {required this.desc, required this.amount, required this.categoryName,required this.transactionDate});
}

class TransactionEntryValidationError extends TransitionEntryValidateState {
  final FieldError fieldError;

  TransactionEntryValidationError(this.fieldError) : super();
}
