import 'package:finq/presentation/journeys/home/ui_models/table_data_provider.dart';
import 'package:finq/presentation/widgets/finq_cash_label.dart';
import 'package:flutter/material.dart';

class TransactionItemRow extends StatelessWidget {
  final DataItem dataItem;

  const TransactionItemRow({Key? key, required this.dataItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                dataItem.categoryName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                dataItem.desc + dataItem.desc + dataItem.desc,
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: dataItem.transactionType == 0
                  ? FinQCashLabel(
                      title: dataItem.amount,
                      onPressed: () {},
                      textStyle: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Theme.of(context).accentColor),
                    )
                  : SizedBox()),
          Expanded(
              flex: 2,
              child: dataItem.transactionType == 1
                  ? FinQCashLabel(
                      title: dataItem.amount,
                      onPressed: () {},
                      textStyle: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.redAccent),
                    )
                  : SizedBox()),
        ],
      ),
    );
  }
}
