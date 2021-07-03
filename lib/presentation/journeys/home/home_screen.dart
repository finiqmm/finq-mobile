import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/database/finq_db.dart';
import 'package:finq/di/get_it.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:finq/presentation/journeys/add_transaction/add_transaction.dart';
import 'package:finq/presentation/journeys/add_transaction/transaction_action_state.dart';
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
  late FinqDb finqDb;

  @override
  void initState() {
    super.initState();
    debugPrint('fwefw');
    BlocProvider.of<ProfileBloc>(context).add(LoadProfileEvent());
    transactionBloc = getItInstance<TransactionBloc>();

    transactionBloc.add(GetTotalExpenseEvent(
        DateTime(DateTime.now().year, DateTime.now().month),
        DateTime(DateTime.now().year, DateTime.now().month + 1)));
    transactionBloc.add(GetTotalIncomeEvent(
        DateTime(DateTime.now().year, DateTime.now().month),
        DateTime(DateTime.now().year, DateTime.now().month + 1)));

    // finqDb = getItInstance<FinqDb>();
    // finqDb
    //     .watchTransactionsWithDates(
    //         DateTime(DateTime.now().year, DateTime.now().month),
    //         DateTime(DateTime.now().year, DateTime.now().month + 1))
    //     .listen((event) {
    //   debugPrint('$event fewf');
    // });
  }

  @override
  void dispose() {
    transactionBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => transactionBloc,
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
                    _showTransactionBottomSheet(
                        context, TransactionType.INCOME);
                  }),
              ActionButton(
                bgColor: Colors.redAccent,
                icon: Icon(Icons.add),
                onPressed: () => _showTransactionBottomSheet(
                    context, TransactionType.EXPENSE),
              )
            ],
          ),
        ),
      ),
    );
  }

  _showTransactionBottomSheet(context, TransactionType type) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return BlocProvider<TransactionBloc>.value(
            value: transactionBloc,
            child: AddTransaction(
              transactionActionModel:
                  TransactionActionModel(transactionType: type),
            ),
          );
        });
  }
}
