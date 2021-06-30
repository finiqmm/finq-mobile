import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/di/get_it.dart';
import 'package:finq/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:finq/presentation/journeys/add_transaction/add_transaction.dart';
import 'package:finq/presentation/journeys/add_transaction/transaction_action_state.dart';
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
  @override
  void initState() {
    super.initState();
    transactionBloc = getItInstance<TransactionBloc>();
  }

  @override
  void dispose() {
    debugPrint('Hello Testing');
    transactionBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => transactionBloc,
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text('Home Screen'),
        ),
        floatingActionButton: ExpandableFab(
          distance: 75,
          children: [
            ActionButton(
                bgColor: Colors.greenAccent,
                icon: Icon(Icons.add),
                onPressed: () {
                  _showTransactionBottomSheet(context, TransactionType.INCOME);
                }),
            ActionButton(
              bgColor: Colors.redAccent,
              icon: Icon(Icons.add),
              onPressed: () =>
                  _showTransactionBottomSheet(context, TransactionType.EXPENSE),
            )
          ],
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
