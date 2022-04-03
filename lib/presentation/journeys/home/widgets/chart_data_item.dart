import 'package:finq/presentation/models/transaction_ui_chart_model.dart';
import 'package:flutter/material.dart';

class ChartDataItem extends StatelessWidget {
  final TransactionChartUiModel data;
  const ChartDataItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      minLeadingWidth: 0,
      leading: Container(
        alignment: Alignment.center,
        width: 14,
        height: 14,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 4, color: data.color)),
      ),
      title: Text(
        '${data.categoryName} ${data.percent.toStringAsFixed(1)}%',
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }
}
