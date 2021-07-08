import 'package:finq/common/constants/money_formatter.dart';
import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/common/constants/transaction_types.dart';
import 'package:finq/common/screenutil/screenutil.dart';
import 'package:finq/presentation/models/transaction_action_state.dart';
import 'package:finq/presentation/widgets/finq_alert_button.dart';
import 'package:finq/presentation/widgets/finq_button.dart';
import 'package:flutter/material.dart';
import 'package:finq/common/constants/size_constants.dart';
import 'package:finq/common/extension/size_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:finq/common/extension/int_extension.dart';

import 'transaction_choice_chip.dart';

class AddTrasactionForm extends StatefulWidget {
  final TransactionActionModel transactionActionModel;
  final Function(String? categoryName, String amount, String description,
      DateTime selectedDate) onEntryUpsert;
  final Function onDeletePressed;

  AddTrasactionForm(
      {required this.transactionActionModel,
      required this.onDeletePressed,
      required this.onEntryUpsert});

  @override
  _AddTrasactionFormState createState() => _AddTrasactionFormState();
}

class _AddTrasactionFormState extends State<AddTrasactionForm> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  late DateTime selectedDate;
  String? selectedCategory;
  @override
  void initState() {
    super.initState();
    amountController.text =
        widget.transactionActionModel.totalAmount.toString();
    descriptionController.text = widget.transactionActionModel.desc;
    selectedDate = widget.transactionActionModel.transactionDate ??
        DateTime.now().getOnlyDate();
    selectedCategory = widget.transactionActionModel.categoryName;
  }

  @override
  void dispose() {
    descriptionController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: ScreenUtil.screenHeight,
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(
            horizontal: Sizes.dimen_16.w, vertical: Sizes.dimen_8.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Amount',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.black.withOpacity(0.1), filled: true),
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
          ),
          // Align(
          //   alignment: Alignment.center,
          //   child: Text(
          //     // totalAmount,
          //     NumberFormat.currency(name: '')
          //         .format(double.tryParse(totalAmount)),
          //     style: Theme.of(context).textTheme.headline5,
          //   ),
          // ),
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
                selectedDate = value.getOnlyDate();
              });
            }),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Select Date',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: Sizes.dimen_4.h),
                  padding: EdgeInsets.symmetric(
                      vertical: Sizes.dimen_8.h, horizontal: Sizes.dimen_4.w),
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.1)),
                  child: Text(
                    selectedDate.convertReadableDate(),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                )
              ],
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
              decoration: InputDecoration(
                  fillColor: Colors.black.withOpacity(0.1), filled: true),
              controller: descriptionController,
            ),
          ),
          // NumberTableWidget(onNumberPressed: (String number) {
          //   if (totalAmount.length >= 7) return;
          //   setState(() {
          //     totalAmount = number == '.'
          //         ? AmountInputHandler.onDotPressed(totalAmount)
          //         : AmountInputHandler.onNumberPressed(number, totalAmount);
          //   });
          // }, onClearPressed: () {
          //   setState(() {
          //     totalAmount = '0';
          //   });
          // }),
          SizedBox(
            height: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.transactionActionModel.id == null)
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Container(
                    width: double.infinity,
                    child: FinQButton(
                      onPressed: () {
                        widget.onEntryUpsert(
                            selectedCategory,
                            amountController.text,
                            descriptionController.text,
                            selectedDate);
                      },
                      text: 'Add',
                    ),
                  ),
                ),
              if (widget.transactionActionModel.id != null)
                Row(
                  children: [
                    Expanded(
                      child: FinQButton(
                        onPressed: () {
                          widget.onEntryUpsert(selectedCategory, amountController.text,
                              descriptionController.text, selectedDate);
                        },
                        text: 'Update',
                      ),
                    ),
                    Expanded(
                      child: FinQAlertButton(
                        onPressed: () {
                          widget.onDeletePressed();
                        },
                        text: 'Delete',
                      ),
                    )
                  ],
                )
            ],
          ),
        ]),
      ),
    );
  }
}
