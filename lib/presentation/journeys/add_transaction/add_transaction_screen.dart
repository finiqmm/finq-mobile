import 'package:finq/di/get_it.dart';
import 'package:finq/domain/entities/transaction_entity.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/journeys/add_transaction/add_transaction_form.dart';
import 'package:finq/presentation/models/field_errors.dart';
import 'package:finq/presentation/models/transaction_action_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddTransactionScreen extends StatefulWidget {
  final TransactionActionModel transactionActionModel;

  AddTransactionScreen({required this.transactionActionModel});
  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  late TransactionEntryValidationBloc transEntryValidationBloc;
  late TransactionEntryCubit transEntryCubit;

  @override
  void initState() {
    super.initState();
    transEntryValidationBloc = getItInstance<TransactionEntryValidationBloc>();
    transEntryCubit = getItInstance<TransactionEntryCubit>();
  }

  @override
  void dispose() {
    transEntryValidationBloc.close();
    transEntryCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.transactionActionModel.id != null
            ? 'Edit Transaction'
            : 'Add Transaction'),
      ),
      body: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: transEntryCubit),
            BlocProvider.value(value: transEntryValidationBloc)
          ],
          child: MultiBlocListener(
              listeners: [
                BlocListener<TransactionEntryValidationBloc,
                    TransitionEntryValidateState>(
                  listener: (context, state) {
                    if (state is TransactionEntryValidationError) {
                      if (state.fieldError == FieldError.InvalidAmount) {
                        Fluttertoast.showToast(msg: 'Enter Valid amount');
                      }
                      if (state.fieldError == FieldError.InvalidCategory) {
                        Fluttertoast.showToast(msg: 'Category is required');
                      }
                      if (state.fieldError == FieldError.InvalidDescription) {
                        Fluttertoast.showToast(msg: 'Description is required');
                      }
                    }
                    if (state is TransitionEntryValidateSuccess) {
                      final transitionEntity = TransactionEntity(
                          id: widget.transactionActionModel.id,
                          description: state.desc,
                          amount: state.amount,
                          transactionDate: state.transactionDate,
                          transactionType:
                              widget.transactionActionModel.transactionType,
                          categoryName: state.categoryName);
                      Fluttertoast.showToast(msg: 'Success');
                      transitionEntity.id == null
                          ? context
                              .read<TransactionEntryCubit>()
                              .insertNewEntry(transitionEntity)
                          : context
                              .read<TransactionEntryCubit>()
                              .updateExistingEntry(transitionEntity);
                    }
                  },
                ),
                BlocListener<TransactionEntryCubit, TransactionEntryState>(
                  listener: (context, state) {
                    if (state is TransactionEntrySuccess) {
                      Navigator.pop(context);
                      return;
                    }
                    if (state is TransactionEntryFailed) {
                      Fluttertoast.showToast(msg: state.message);
                      return;
                    }
                  },
                ),
              ],
              child: AddTrasactionForm(
                transactionActionModel: widget.transactionActionModel,
                onDeletePressed: () => transEntryCubit
                    .deleteEntry(widget.transactionActionModel.id!),
                onEntryUpsert: (String? categoryName, String amount,
                    String description, DateTime transactionDate) {
                  transEntryValidationBloc.add(TransactionEntryValidationSubmit(
                      amount: amount,
                      description: description,
                      categoryName: categoryName,
                      selectedDate: transactionDate));
                },
              ))),
    );
  }
}
