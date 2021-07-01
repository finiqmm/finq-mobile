import 'package:finq/common/screenutil/screenutil.dart';
import 'package:flutter/material.dart';

import 'ui_models/table_data_provider.dart';
import 'widgets/transaction_item_row.dart';
import 'widgets/transaction_summary_header.dart';
import 'widgets/transaction_table_header.dart';
import 'package:finq/common/constants/size_constants.dart';
import 'package:finq/common/extension/size_extension.dart';

class TransactionTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil.screenHeight,
        margin: EdgeInsets.all(Sizes.dimen_14),
        color: Colors.white,
        
        child: Column(
    children: [
      TransactionTableHeader(),
      for (var item in TableData.getTableDatas()) ...[
        TransactionSummaryHeader(item),
        for (var rowItem in item.dataItems)
          TransactionItemRow(dataItem: rowItem),
        Divider(
          color: Colors.grey,
        )
      ]
    ],
        ),
      );
  }
}
