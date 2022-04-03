import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/domain/entities/transaction_entity.dart';
import 'package:finq/domain/usecases/use_case_imports.dart';
import 'package:injectable/injectable.dart';

part 'transaction_entry_state.dart';

@injectable
class TransactionEntryCubit extends Cubit<TransactionEntryState> {
  final InsertTransaction insertTransaction;
  final UpdateTransaction updateTransaction;
  final DeleteTransaction deleteTransaction;

  TransactionEntryCubit(
      {required this.insertTransaction,
      required this.updateTransaction,
      required this.deleteTransaction})
      : super(TransactionEntryInitial());

  void insertNewEntry(TransactionEntity transactionEntity) async {
    emit(TransactionEntryProcessing());
    final response = await insertTransaction(transactionEntity);
    emit(response.fold((l) => TransactionEntryFailed(l.message),
        (r) => TransactionEntrySuccess()));
  }

  void updateExistingEntry(TransactionEntity transactionEntity) async {
    emit(TransactionEntryProcessing());

    final response = await updateTransaction(transactionEntity);
    emit(response.fold((l) => TransactionEntryFailed(l.message),
        (r) => TransactionEntrySuccess()));
  }

  void deleteEntry(int id) async {
    emit(TransactionEntryProcessing());

    final response = await deleteTransaction(id);
    emit(response.fold((l) => TransactionEntryFailed(l.message),
        (r) => TransactionEntrySuccess()));
  }
}
