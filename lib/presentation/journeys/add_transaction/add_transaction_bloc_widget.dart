import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/models/field_errors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTransactionBlocWidget extends StatelessWidget {
  final Widget child;
  final Function(String) onEntryFailed;
  final Function onEntrySuccess;
  final Function(String) onValidationFailed;
  final Function(TransitionEntryValidateSuccess) onValidationSuccess;

  AddTransactionBlocWidget(
      {required this.child,
      required this.onValidationFailed,
      required this.onEntryFailed,
      required this.onEntrySuccess,
      required this.onValidationSuccess});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<TransactionEntryValidationBloc,
            TransitionEntryValidateState>(
          listener: (context, state) {
            if (state is TransactionEntryValidationError) {
              var failedReason = '';
              if (state.fieldError == FieldError.InvalidAmount) {
                failedReason = 'Enter Valid amount';
              }
              if (state.fieldError == FieldError.InvalidCategory) {
                failedReason = 'Category is required';
              }
              if (state.fieldError == FieldError.InvalidDescription) {
                failedReason = 'Description is required';
              }

              onValidationFailed(failedReason);
            }

            if (state is TransitionEntryValidateSuccess) {
              onValidationSuccess(state);
            }
          },
        ),
        BlocListener<TransactionEntryCubit, TransactionEntryState>(
          listener: (context, state) {
            debugPrint(state.runtimeType.toString());
            if (state is TransactionEntrySuccess) {
              onEntrySuccess();
            }
            if (state is TransactionEntryFailed) {
              onEntryFailed(state.message);
            }
          },
        ),
      ],
      child: child,
    );
  }
}
