import 'package:finq/common/constants/size_constants.dart';
import 'package:finq/common/constants/transaction_types.dart';
import 'package:finq/presentation/journeys/add_transaction/amount_input_handler.dart';
import 'package:finq/presentation/journeys/add_transaction/transaction_choice_chip.dart';
import 'package:flutter/material.dart';
import 'package:finq/common/extension/size_extension.dart';
import 'package:finq/common/extension/int_extension.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'numbers_table_widget.dart';

class AddTransaction extends StatefulWidget {
  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final TextEditingController descriptionController = TextEditingController();
  String selectedDate = DateTime.now().convertReadableDate();
  String totalAmount = "0";
  String? selectedCategory;

  @override
  void initState() {
    super.initState();
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
                        transactionCategories: expenseTransactions,
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
                      selectedDate = value.convertReadableDate();
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
                                selectedDate,
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
                  if (number == '.') {
                    setState(() {
                      totalAmount = AmountInputHandler.onDotPressed(totalAmount);
                    });
                  } else {
                    setState(() {
                      totalAmount = AmountInputHandler.onNumberPressed(number,totalAmount);
                    });
                  }
                }, onClearPressed: () {
                  setState(() {
                    totalAmount = '0';
                  });
                }),
                
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    if (descriptionController.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'Description is required');
                      return;
                    }
                    if (selectedCategory == null) {
                      Fluttertoast.showToast(msg: 'Category is required');
                      return;
                    }
                    Fluttertoast.showToast(msg: 'Success');
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
                )
              ]),
        );
      },
    );
  }
}
