import 'package:finq/common/screenutil/screenutil.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/bloc/transaction_query/transaction_query_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/transaction_item_row.dart';
import 'widgets/transaction_summary_header.dart';
import 'widgets/transaction_table_header.dart';
import 'package:finq/common/constants/size_constants.dart';

class TransactionTableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.screenWidth,
      margin: EdgeInsets.all(Sizes.dimen_14),
      color: Colors.white,
      
      child: BlocBuilder<TransactionQueryCubit, TransactionQueryState>(
        builder: (context, state) {
          if (state is TransactionListQueryLoadedState) {
            return Column(
              children: [
                TransactionTableHeader(),
                for (var item in state.transactionUiModel) ...[
                  TransactionSummaryHeader(item),
                  if (item.transactionItems.isNotEmpty)
                    for (var rowItem in item.transactionItems)
                      TransactionItemRow(dataItem: rowItem),
                  Divider(
                    color: Colors.grey,
                  )
                ]
              ],
            );
          } else if (state is TransactionQueryLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
