import 'package:finq/common/constants/money_formatter.dart';
import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/di/get_it.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/bloc/home_chart_data/home_chart_data_bloc.dart';
import 'package:finq/presentation/bloc/transaction_query/transaction_query_cubit.dart';
import 'package:finq/presentation/journeys/home/widgets/date_range_picker_widget.dart';
import 'package:finq/presentation/models/transaction_action_state.dart';
import 'package:finq/presentation/journeys/home/home_chart_widget.dart';
import 'package:finq/presentation/journeys/home/widgets/trasaction_type_tab.dart';
import 'package:finq/presentation/models/transaction_ui_list_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'transaction_table_widget.dart';
import 'widgets/expandable_fab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TransactionQueryCubit transactionQueryBloc;
  late HomeChartDataBloc homeChartDataBloc;
  late TotalAmountBloc totalAmountBloc;
  late HomeMainBloc homeMainBloc;
  TransactionUiListFilter dropdownValue = TransactionUiListFilter.DAILY;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileBloc>(context).add(LoadProfileEvent());
   
    homeMainBloc = getItInstance<HomeMainBloc>();
    homeChartDataBloc = homeMainBloc.homeChartDataBloc;
    totalAmountBloc = homeMainBloc.totalAmountBloc;
    transactionQueryBloc = homeMainBloc.transactionQueryBloc;
    homeMainBloc.add(LoadHomeInitialData());
   
  }

  @override
  void dispose() {
    transactionQueryBloc.close();
    homeChartDataBloc.close();
    totalAmountBloc.close();
    homeMainBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: homeMainBloc),
        BlocProvider.value(value: totalAmountBloc),
        BlocProvider.value(value: homeChartDataBloc),
        BlocProvider.value(value: transactionQueryBloc)
      ],
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                HomeChartWidget(
                  onDropdownChange: (value) {
                    setState(() {
                      dropdownValue = getFilterEnum(value);
                    });
                  },
                ),
                AnimatedCrossFade(
                    firstChild: DateRangePickerWidget(),
                    secondChild: SizedBox.shrink(),
                    crossFadeState:
                        dropdownValue == TransactionUiListFilter.DAILY
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                    duration: Duration(milliseconds: 500)),
                TransactionTypeTab(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Daily Transaction',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                TransactionTableWidget()
              ],
            ),
          ),
          floatingActionButton: ExpandableFab(
            distance: 75,
            children: [
              ActionButton(
                  bgColor: Colors.greenAccent,
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.pushNamed(context, RouteList.add_transaction,
                        arguments: TransactionActionModel(
                            transactionType: TransactionType.INCOME));
                  }),
              ActionButton(
                  bgColor: Colors.redAccent,
                  icon: Icon(Icons.add),
                  onPressed: () => Navigator.pushNamed(
                      context, RouteList.add_transaction,
                      arguments: TransactionActionModel(
                          transactionType: TransactionType.EXPENSE)))
            ],
          ),
        ),
      ),
    );
  }
}
