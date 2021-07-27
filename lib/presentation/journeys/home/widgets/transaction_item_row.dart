import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/domain/entities/transaction_entity.dart';
import 'package:finq/presentation/models/transaction_action_state.dart';
import 'package:finq/presentation/widgets/finq_cash_label.dart';
import 'package:flutter/material.dart';
import 'package:finq/common/extension/int_extension.dart';

class TransactionItemRow extends StatelessWidget {
  final TransactionEntity dataItem;

  const TransactionItemRow({Key? key, required this.dataItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: GestureDetector(
        onTap: () {
          final item = TransactionActionModel.fromTransactionEntity(dataItem);
          Navigator.pushNamed(context, RouteList.add_transaction,
              arguments: item);

          debugPrint('$dataItem');
        },
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
                  dataItem.description,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: dataItem.transactionType == TransactionType.INCOME
                    ? FinQCashLabel(
                        title: dataItem.amount.convertToCurrency(),
                        textStyle: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: Theme.of(context).accentColor),
                      )
                    : SizedBox()),
            Expanded(
                flex: 2,
                child: dataItem.transactionType == TransactionType.EXPENSE
                    ? FinQCashLabel(
                        title: dataItem.amount.convertToCurrency(),
                        textStyle: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: Colors.redAccent),
                      )
                    : SizedBox()),
          ],
        ),
      ),
    );
  }
}
