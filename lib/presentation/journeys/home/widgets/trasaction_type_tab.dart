import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:finq/common/extension/int_extension.dart';

class TransactionTypeTab extends StatefulWidget {
  @override
  _TransactionTypeTabState createState() => _TransactionTypeTabState();
}

class _TransactionTypeTabState extends State<TransactionTypeTab> {
  int selectedIndex = 0;

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
        child: BlocConsumer<TotalAmountBloc, TotalAmountState>(
          buildWhen: (previous, current) => current is TotalAmountLoadedState,
          listenWhen: (previous, current) =>
              current is TotalAmountLoadErrorState,
          listener: (context, state) {
            if (state is TotalAmountLoadErrorState) {
              Fluttertoast.showToast(msg: 'Error displaying total amount');
            }
          },
          builder: (context, state) {
            if (state is TotalAmountLoadedState) {
              return DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: TabBar(
                    onTap: (index) {
                      if (index == selectedIndex) return;
                      selectedIndex = index;

                      if (index == 0) {
                        context.read<HomeChartDataBloc>().add(
                            HomeChartDataLoadEvent(
                                startDate: DateTime(
                                    DateTime.now().year, DateTime.now().month),
                                endDate: DateTime(DateTime.now().year,
                                    DateTime.now().month + 1),
                                type: TransactionType.INCOME));
                      } else {
                        context.read<HomeChartDataBloc>().add(
                            HomeChartDataLoadEvent(
                                startDate: DateTime(
                                    DateTime.now().year, DateTime.now().month),
                                endDate: DateTime(DateTime.now().year,
                                    DateTime.now().month + 1),
                                type: TransactionType.EXPENSE));
                      }
                    },
                    tabs: [
                      _buildRichTextTab(
                          context,
                          'Income',
                          state.totalAmountEntity.totalIncomeAmount
                              .convertToCurrency()),
                      _buildRichTextTab(
                          context,
                          'Expense',
                          state.totalAmountEntity.totalExpenseAmount
                              .convertToCurrency())
                    ]),
              );
            }
            return SizedBox.fromSize();
          },
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
