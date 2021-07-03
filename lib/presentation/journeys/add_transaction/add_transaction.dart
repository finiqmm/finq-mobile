import 'package:finq/common/constants/size_constants.dart';
import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/common/constants/transaction_types.dart';
import 'package:finq/di/get_it.dart';
import 'package:finq/domain/entities/transaction_entity.dart';
import 'package:finq/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:finq/presentation/journeys/add_transaction/amount_input_handler.dart';
import 'package:finq/presentation/journeys/add_transaction/transaction_action_state.dart';
import 'package:finq/presentation/journeys/add_transaction/transaction_choice_chip.dart';
import 'package:flutter/material.dart';
import 'package:finq/common/extension/size_extension.dart';
import 'package:finq/common/extension/int_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:finq/database/finq_db.dart';

import 'numbers_table_widget.dart';

class AddTransaction extends StatefulWidget {
  final TransactionActionModel transactionActionModel;

  AddTransaction({required this.transactionActionModel});
  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final TextEditingController descriptionController = TextEditingController();
  late DateTime selectedDate;
  String totalAmount = "0";
  String? selectedCategory;
  late FinqDb finqDb;

  @override
  void initState() {
    super.initState();
    descriptionController.text = widget.transactionActionModel.desc;
    selectedDate =
        widget.transactionActionModel.transactionDate ?? DateTime.now();
    selectedCategory = widget.transactionActionModel.categoryName;
    finqDb = getItInstance<FinqDb>();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 0.9,
      minChildSize: 0.5,
      initialChildSize: 0.7,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: ListView(
              controller: scrollController,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Enter Amount',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    totalAmount,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                ExpansionTile(
                  tilePadding: EdgeInsets.all(0),
                  title: Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select Category',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              selectedCategory ?? '',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                        ],
                      )),
                  children: [
                    TransactionChoiceChip(
                        initialSelectedChip: selectedCategory,
                        transactionCategories:
                            widget.transactionActionModel.transactionType ==
                                    TransactionType.INCOME
                                ? incomeTransactions
                                : expenseTransactions,
                        onItemSelected: (selectedItem) {
                          setState(() {
                            selectedCategory = selectedItem;
                          });
                        })
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () => showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2222))
                      .then((value) {
                    setState(() {
                      selectedDate = value ?? DateTime.now();
                    });
                  }),
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Select Date',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(
                                selectedDate.convertReadableDate(),
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          FontAwesomeIcons.chevronDown,
                          size: 14,
                          color: Colors.grey[500],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TextField(
                    controller: descriptionController,
                  ),
                ),
                NumberTableWidget(onNumberPressed: (String number) {
                  if (totalAmount.length >= 7) return;
                  setState(() {
                    totalAmount = number == '.'
                        ? AmountInputHandler.onDotPressed(totalAmount)
                        : AmountInputHandler.onNumberPressed(
                            number, totalAmount);
                  });
                }, onClearPressed: () {
                  setState(() {
                    totalAmount = '0';
                  });
                }),
                SizedBox(
                  height: 16,
                ),
                BlocListener<TransactionBloc, TransactionState>(
                  listener: (context, state) {
                    if (state is InsertSuccess) {
                      Navigator.pop(context);
                      return;
                    }
                    if (state is TransactionError) {
                      Fluttertoast.showToast(msg: state.message);
                    }
                  },
                  child: GestureDetector(
                    onTap: () {
                      if (descriptionController.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'Description is required');
                        return;
                      }
                      if (selectedCategory == null) {
                        Fluttertoast.showToast(msg: 'Category is required');
                        return;
                      }
                      if (!AmountInputHandler.isInputValid(totalAmount)) {
                        Fluttertoast.showToast(msg: 'Enter valid amount');
                        return;
                      }
                      var transitionEntity = TransactionEntity(
                          null,
                          descriptionController.text,
                          double.parse(totalAmount),
                          selectedDate,
                          widget.transactionActionModel.transactionType,
                          selectedCategory!);

                      debugPrint(transitionEntity.toString());
                      Fluttertoast.showToast(msg: 'Success');
                      BlocProvider.of<TransactionBloc>(context)
                          .add(NewTransactionInsertEvent(transitionEntity));
                    },
                    child: Container(
                      padding: EdgeInsets.all(14),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        'Add',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ]),
        );
      },
    );
  }
}
