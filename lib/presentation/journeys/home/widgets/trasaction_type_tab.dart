import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/common/constants/translation_constants.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:finq/common/extension/int_extension.dart';
import 'package:finq/common/extension/string_extension.dart';

class TransactionTypeTab extends StatefulWidget {
  final DateTimeRange currentDateRange;

  TransactionTypeTab({required this.currentDateRange});
  @override
  _TransactionTypeTabState createState() => _TransactionTypeTabState();
}

class _TransactionTypeTabState extends State<TransactionTypeTab> {
  int selectedIndex = 0;

  @override
  void didUpdateWidget(TransactionTypeTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    dispatchBloc();
  }

  void dispatchBloc() {
    debugPrint('HomeScreen Dispatch ${widget.currentDateRange}');
    context.read<HomeChartDataBloc>().add(HomeChartDataLoadEvent(
        dateTimeRange: widget.currentDateRange,
        type: selectedIndex == 0
            ? TransactionType.INCOME
            : TransactionType.EXPENSE));

            

  }

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
        child: BlocConsumer<TotalAmountCubit, TotalAmountState>(
          buildWhen: (previous, current) {
            return current is TotalAmountLoadedState;
          },
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
                initialIndex: selectedIndex,
                child: TabBar(
                    onTap: (index) {
                      if (index == selectedIndex) return;
                      selectedIndex = index;
                      dispatchBloc();
                    },
                    tabs: [
                      _buildRichTextTab(
                          context,
                          TranslationConstants.titleIncome.t(context),
                          state.totalAmountEntity.totalIncomeAmount
                              .convertToCurrency()),
                      _buildRichTextTab(
                          context,
                          TranslationConstants.titleExpense.t(context),
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