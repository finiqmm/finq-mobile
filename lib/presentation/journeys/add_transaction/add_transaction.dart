import 'package:finq/common/constants/size_constants.dart';
import 'package:finq/common/constants/transaction_types.dart';
import 'package:finq/presentation/journeys/add_transaction/transaction_choice_chip.dart';
import 'package:flutter/material.dart';
import 'package:finq/common/extension/size_extension.dart';
import 'package:finq/common/extension/int_extension.dart';

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
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: const Radius.circular(25.0),
          )),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return TransactionChoiceChip(
                              transactionCategories: expenseTransactions,
                              onItemSelected: (selectedItem) {
                                setState(() {
                                  selectedCategory = selectedItem;
                                });
                              });
                        });
                  },
                  child: Container(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select Date',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              selectedDate,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                        ],
                      )),
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

                // TransactionChoiceChip(
                //   transactionCategories: expenseTransactions,
                //   onItemSelected: (selectedItem) {
                //     debugPrint(selectedItem);
                //   },
                // ),
                NumberTableWidget((int number) {
                  debugPrint(number.toString());
                  setState(() {
                    if (totalAmount != "0") {
                      totalAmount = totalAmount + number.toString();
                    } else {
                      totalAmount = number.toString();
                    }
                  });
                }, () {
                  setState(() {
                    totalAmount = "0";
                  });
                }),

                SizedBox(
                  height: 16,
                ),
                Container(
                  padding: EdgeInsets.all(14),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    'Calculate',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                )
              ])),
    );
  }
}
