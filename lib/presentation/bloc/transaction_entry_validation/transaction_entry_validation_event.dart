part of 'transaction_entry_validation_bloc.dart';

abstract class TransactionEntryValidationEvent {}

class TransactionEntryValidationSubmit extends TransactionEntryValidationEvent {
  final String description;
  final String? categoryName;
  final String amount;
  final DateTime selectedDate;

  TransactionEntryValidationSubmit(
      {this.categoryName,
      required this.description,
      required this.amount,
      required this.selectedDate});
}
