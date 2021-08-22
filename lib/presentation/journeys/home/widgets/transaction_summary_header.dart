import 'package:finq/presentation/models/transaction_ui_model.dart';
import 'package:finq/presentation/widgets/finq_cash_label.dart';
import 'package:flutter/material.dart';
import 'package:finq/common/extension/string_extension.dart';

class TransactionSummaryHeader extends StatelessWidget {
  final TransactionUiModel uiModel;

  TransactionSummaryHeader(this.uiModel);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 6,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: context.getCashColor(uiModel.totalIncomeAmount, uiModel.totalExpenseAmount))),
                child: Text(
                  uiModel.transactionDate,
                  style: Theme.of(context).textTheme.caption,
                ),
              )
            ],
          ),
        ),
        Expanded(
            flex: 2,
            child: FinQCashLabel(
              textStyle: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.blue, fontWeight: FontWeight.w500),
              title: uiModel.totalIncomeAmount,
            )),
        Expanded(
            flex: 2,
            child: FinQCashLabel(
              textStyle: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.redAccent, fontWeight: FontWeight.w500),
              title: uiModel.totalExpenseAmount,
            )),
      ],
    );
  }
}
