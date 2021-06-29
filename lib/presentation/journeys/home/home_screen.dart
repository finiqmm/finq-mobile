import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/presentation/journeys/add_transaction/add_transaction.dart';
import 'package:flutter/material.dart';

import 'widgets/expandable_fab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                _showTransactionBottomSheet(context);
              }),
          ActionButton(
            bgColor: Colors.redAccent,
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  _showTransactionBottomSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return AddTransaction();
        });
  }
}
