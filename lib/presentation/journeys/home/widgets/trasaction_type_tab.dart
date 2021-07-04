import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionTypeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: Colors.grey[400],
      ),
      child: Material(
        elevation: 10,
        shadowColor: Colors.transparent,
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: TabBar(
              onTap: (index) {
                if (index == 0) {
                  context.read<HomeChartDataBloc>().add(HomeChartDataLoadEvent(
                      startDate:
                          DateTime(DateTime.now().year, DateTime.now().month),
                      endDate: DateTime(
                          DateTime.now().year, DateTime.now().month + 1),
                      type: TransactionType.INCOME));
                } else {
                  context.read<HomeChartDataBloc>().add(HomeChartDataLoadEvent(
                      startDate:
                          DateTime(DateTime.now().year, DateTime.now().month),
                      endDate: DateTime(
                          DateTime.now().year, DateTime.now().month + 1),
                      type: TransactionType.EXPENSE));
                }
              },
              tabs: [
                BlocBuilder<TransactionBloc, TransactionState>(
                  buildWhen: (previous, current) {
                    return current is TotalIncomeAmountState &&
                        current is! TotalExpenseAmountState;
                  },
                  builder: (BuildContext context, TransactionState state) {
                    if (state is TotalIncomeAmountState) {
                      return _buildRichTextTab(
                          context, 'Income', state.amount.toString());
                    }
                    return SizedBox.shrink();
                  },
                ),
                BlocBuilder<TransactionBloc, TransactionState>(
                  buildWhen: (previous, current) {
                    return current is TotalExpenseAmountState &&
                        current is! TotalIncomeAmountState;
                  },
                  builder: (BuildContext context, TransactionState state) {
                    if (state is TotalExpenseAmountState) {
                      return _buildRichTextTab(
                          context, 'Expense', state.amount.toStringAsFixed(3));
                    }
                    return SizedBox.shrink();
                  },
                ),
              ]),
        ),
      ),
    );
  }

  Widget _buildRichTextTab(context, String transType, String amount) {
    return Tab(
      child: RichText(
          text: TextSpan(children: [
        TextSpan(text: transType, style: Theme.of(context).textTheme.caption),
        TextSpan(text: amount, style: Theme.of(context).textTheme.subtitle2)
      ])),
    );
  }
}
