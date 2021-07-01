import 'package:finq/presentation/journeys/home/ui_models/table_data_provider.dart';
import 'package:finq/presentation/widgets/finq_cash_label.dart';
import 'package:flutter/material.dart';

class TransactionSummaryHeader extends StatelessWidget {
  final TableData tableData;

  TransactionSummaryHeader(this.tableData);

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
                    border: Border.all(color: Theme.of(context).accentColor)),
                child: Text(
                  tableData.dateString,
                  style: Theme.of(context).textTheme.caption,
                ),
              )
            ],
          ),
        ),
        Expanded(
            flex: 2,
            child: FinQCashLabel(
              onPressed: () {},
              textStyle: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.blue, fontWeight: FontWeight.w500),
              title: tableData.totalIncome,
            )),
        Expanded(
            flex: 2,
            child: FinQCashLabel(
              onPressed: () {},
              textStyle: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.redAccent, fontWeight: FontWeight.w500),
              title: tableData.totalExpense,
            )),
      ],
    );
  }
}
