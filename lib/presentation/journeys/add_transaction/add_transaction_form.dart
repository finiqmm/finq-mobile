import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/common/constants/transaction_types.dart';
import 'package:finq/common/constants/translation_constants.dart';
import 'package:finq/common/screenutil/screenutil.dart';
import 'package:finq/presentation/common_widget/finq_alert_button.dart';
import 'package:finq/presentation/common_widget/finq_button.dart';
import '../../common_widget/num_pad_keys.dart';
import 'package:finq/presentation/models/transaction_action_state.dart';
import 'package:flutter/material.dart';
import 'package:finq/common/constants/size_constants.dart';
import 'package:finq/common/extension/size_extension.dart';
import 'package:finq/common/extension/int_extension.dart';
import 'package:finq/common/extension/string_extension.dart';

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
  final TextEditingController _descController = TextEditingController();
  final _descFocusNode = FocusNode();
  late ScrollController _scrollController;
  final TextEditingController _amountController = TextEditingController();
  late DateTime selectedDate;
  String? selectedCategory;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    if (widget.transactionActionModel.id != null) {
      _amountController.text =
          widget.transactionActionModel.totalAmount.toString();
    }

    _descController.text = widget.transactionActionModel.desc;
    selectedDate = widget.transactionActionModel.transactionDate ??
        DateTime.now().getOnlyDate();
    selectedCategory = widget.transactionActionModel.categoryName;
  }

  @override
  void dispose() {
    _descController.dispose();
    _amountController.dispose();
    _descFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(
            horizontal: Sizes.dimen_16.w, vertical: Sizes.dimen_8.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            TranslationConstants.titleAmount.t(context),
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: TextField(
              decoration: InputDecoration(filled: true),
              controller: _amountController,
              keyboardType: TextInputType.none,
              autofocus: false,
              enabled: false,
              enableInteractiveSelection: false,
              showCursor: false,
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
                      TranslationConstants.titleCategory.t(context),
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
                  TranslationConstants.titleDate.t(context),
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: Sizes.dimen_4.h),
                  padding: EdgeInsets.symmetric(
                      vertical: Sizes.dimen_8.h, horizontal: Sizes.dimen_4.w),
                  decoration: BoxDecoration(color: Colors.grey),
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
            TranslationConstants.titleDesc.t(context),
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: TextField(
              decoration: InputDecoration(filled: true),
              controller: _descController,
              focusNode: _descFocusNode,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          NumkeyPad(
            onBackPressTap: () {
              onNumKeyPadActionDone();
              if (_amountController.text.isNotEmpty) {
                _amountController.text = _amountController.text
                    .substring(0, _amountController.text.length - 1);
              }
            },
            onKeyboardTap: (val) {
              onNumKeyPadActionDone();

              _amountController.text += val;
            },
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
                            _amountController.text,
                            _descController.text,
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
                          widget.onEntryUpsert(
                              selectedCategory,
                              _amountController.text,
                              _descController.text,
                              selectedDate);
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

  void onNumKeyPadActionDone() {
    _descFocusNode.unfocus();
    _scrollController.animateTo(0,
        duration: Duration(milliseconds: 3), curve: Curves.easeIn);
  }
}
