import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/common/constants/transaction_types.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/models/transaction_action_state.dart';
import 'package:finq/presentation/widgets/finq_alert_button.dart';
import 'package:finq/presentation/widgets/finq_button.dart';
import 'package:flutter/material.dart';
import 'package:finq/common/constants/size_constants.dart';
import 'package:finq/common/extension/size_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:finq/common/extension/int_extension.dart';

import 'amount_input_handler.dart';
import 'numbers_table_widget.dart';
import 'transaction_choice_chip.dart';

class AddTrasactionForm extends StatefulWidget {
  final ScrollController scrollController;
  final TransactionActionModel transactionActionModel;
  final Function(String? categoryName, String amount, String description,
      DateTime selectedDate) onEntryUpsert;
  final Function onDeletePressed;

  AddTrasactionForm(
      {required this.scrollController,
      required this.transactionActionModel,
      required this.onDeletePressed,
      required this.onEntryUpsert});

  @override
  _AddTrasactionFormState createState() => _AddTrasactionFormState();
}

class _AddTrasactionFormState extends State<AddTrasactionForm> {
  final TextEditingController descriptionController = TextEditingController();
  late DateTime selectedDate;
  String totalAmount = "0";
  String? selectedCategory;
  @override
  void initState() {
    super.initState();
    totalAmount = widget.transactionActionModel.totalAmount.toString();
    descriptionController.text = widget.transactionActionModel.desc;
    selectedDate =
        widget.transactionActionModel.transactionDate ?? DateTime.now().getOnlyDate();
    selectedCategory = widget.transactionActionModel.categoryName;
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: ListView(
          controller: widget.scrollController,
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
                  selectedDate = value.getOnlyDate();
                
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
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
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
                    : AmountInputHandler.onNumberPressed(number, totalAmount);
              });
            }, onClearPressed: () {
              setState(() {
                totalAmount = '0';
              });
            }),
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
                          widget.onEntryUpsert(selectedCategory, totalAmount,
                              descriptionController.text, selectedDate);
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
                            widget.onEntryUpsert(selectedCategory, totalAmount,
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
    );
  }
}
