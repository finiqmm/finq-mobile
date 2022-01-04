import 'package:finq/common/constants/money_formatter.dart';
import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/di/injectable.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/bloc/date_selection/date_selection_cubit.dart';
import 'package:finq/presentation/bloc/home_chart_data/home_chart_data_bloc.dart';
import 'package:finq/presentation/bloc/transaction_query/transaction_query_cubit.dart';
import 'package:finq/presentation/journeys/home/transaction_table_widget.dart';
import 'package:finq/presentation/models/transaction_action_state.dart';
import 'package:finq/presentation/journeys/home/home_chart_widget.dart';
import 'package:finq/presentation/journeys/home/widgets/trasaction_type_tab.dart';
import 'package:finq/presentation/models/transaction_ui_list_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'delegates/home_chart_delegate.dart';
import 'delegates/home_transaction_list_delegate.dart';
import 'widgets/date_range_picker_widget.dart';
import 'widgets/expandable_fab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TransactionQueryCubit transactionQueryBloc;
  late HomeChartDataBloc homeChartDataBloc;
  late TotalAmountCubit totalAmountBloc;
  late HomeMainBloc homeMainBloc;
  late DateSelectionCubit dateSelectionCubit;

  final HomeChartWidgetDelegate chartDelegate = HomeChartWidgetDelegate();
  final HomeTransactionListDelegate transactionListDelegate =
      HomeTransactionListDelegate();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileBloc>(context).add(LoadProfileEvent());

    homeMainBloc = getItInstance<HomeMainBloc>();
    dateSelectionCubit = getItInstance<DateSelectionCubit>();
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
    dateSelectionCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: homeMainBloc),
        BlocProvider.value(value: totalAmountBloc),
        BlocProvider.value(value: homeChartDataBloc),
        BlocProvider.value(value: transactionQueryBloc),
        BlocProvider.value(value: dateSelectionCubit)
      ],
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<DateSelectionCubit, DateSelectionState>(
            builder: (context, state) {
              return CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: HomeChartWidget(
                      currentDateRange: state.currentDateRange,
                      transactionListDelegate: transactionListDelegate,
                      onDropdownChange: (value) {
                        transactionListDelegate.onHomeScreenFilterChange!();
                        context
                            .read<DateSelectionCubit>()
                            .changeDateSelectionState(value);
                      },
                    ),
                  ),
                  if (state.listFilter == TransactionUiListFilter.DAILY)
                    SliverToBoxAdapter(
                      child:
                          DateRangePickerWidget(selectedDateRange: (dateRange) {
                        context
                            .read<DateSelectionCubit>()
                            .changeDateRange(dateRange);
                      }),
                    ),
                  SliverToBoxAdapter(
                    child: TransactionTypeTab(
                      currentDateRange: state.currentDateRange,
                      homeChartWidgetDelegate: chartDelegate,
                      homeChartDataBloc: homeChartDataBloc,
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        '${state.listFilter.displayTitle} Transaction',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                  SliverList(
                      delegate:
                          SliverChildListDelegate([TransactionTableWidget()]))
                ],
              );
            },
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
