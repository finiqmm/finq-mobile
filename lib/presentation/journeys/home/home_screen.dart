import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/di/get_it.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:finq/presentation/models/transaction_action_state.dart';
import 'package:finq/presentation/journeys/home/home_chart_widget.dart';
import 'package:finq/presentation/journeys/home/transaction_table_widget.dart';
import 'package:finq/presentation/journeys/home/widgets/trasaction_type_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/expandable_fab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TransactionBloc transactionBloc;
  late HomeChartDataBloc homeChartDataBloc;
  late TotalAmountBloc totalAmountBloc;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileBloc>(context).add(LoadProfileEvent());
    transactionBloc = getItInstance<TransactionBloc>();
    homeChartDataBloc = getItInstance<HomeChartDataBloc>();
    totalAmountBloc = getItInstance<TotalAmountBloc>();

    totalAmountBloc.add(LoadTotalAmount(
        startDate: DateTime(DateTime.now().year, DateTime.now().month),
        endDate: DateTime(DateTime.now().year, DateTime.now().month + 1)));

    homeChartDataBloc.add(HomeChartDataLoadEvent(
        startDate: DateTime(DateTime.now().year, DateTime.now().month),
        endDate: DateTime(DateTime.now().year, DateTime.now().month + 1),
        type: TransactionType.INCOME));

    // transactionBloc.add(GetTotalExpenseEvent(
    //     DateTime(DateTime.now().year, DateTime.now().month),
    //     DateTime(DateTime.now().year, DateTime.now().month + 1)));
    // transactionBloc.add(GetTotalIncomeEvent(
    //     DateTime(DateTime.now().year, DateTime.now().month),
    //     DateTime(DateTime.now().year, DateTime.now().month + 1)));

    // transactionBloc.add(LoadTransactionBetweenRange(
    //     DateTime(DateTime.now().year, DateTime.now().month),
    //     DateTime(DateTime.now().year, DateTime.now().month + 1)));
  }

  @override
  void dispose() {
    transactionBloc.close();
    homeChartDataBloc.close();
    totalAmountBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => transactionBloc),
        BlocProvider(create: (context) => homeChartDataBloc),
        BlocProvider(create: (context) => totalAmountBloc)
      ],
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                HomeChartWidget(),
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
