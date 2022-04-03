import 'package:finq/di/injectable.dart';
import 'package:finq/domain/entities/transaction_entity.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/journeys/add_transaction/add_transaction_bloc_widget.dart';
import 'package:finq/presentation/journeys/add_transaction/add_transaction_form.dart';
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
          child: AddTransactionBlocWidget(
            onEntryFailed: (reason) {
              Fluttertoast.showToast(msg: reason);
            },
            onEntrySuccess: () {
              Navigator.pop(context);
            },
            onValidationFailed: (reason) {
              Fluttertoast.showToast(msg: reason);
            },
            onValidationSuccess: (state) {
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
                  ? transEntryCubit.insertNewEntry(transitionEntity)
                  : transEntryCubit.updateExistingEntry(transitionEntity);
            },
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
            ),
          )),
    );
  }
}
