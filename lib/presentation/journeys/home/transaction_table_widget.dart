import 'package:finq/common/screenutil/screenutil.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui_models/table_data_provider.dart';
import 'widgets/transaction_item_row.dart';
import 'widgets/transaction_summary_header.dart';
import 'widgets/transaction_table_header.dart';
import 'package:finq/common/constants/size_constants.dart';
import 'package:finq/common/extension/size_extension.dart';

class TransactionTableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.screenHeight,
      margin: EdgeInsets.all(Sizes.dimen_14),
      color: Colors.white,
      child: BlocBuilder<TransactionBloc, TransactionState>(
        buildWhen: (previous, current) => current is TransactionListLoadedState,
        builder: (context, state) {
          if (state is TransactionListLoadedState) {
            return Column(
              children: [
                TransactionTableHeader(),
                for (var item in state.transactionUiModel) ...[
                  TransactionSummaryHeader(item),
                  for (var rowItem in item.transactionItems)
                    TransactionItemRow(dataItem: rowItem),
                  Divider(
                    color: Colors.grey,
                  )
                ]
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
