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
            icon: Icon(Icons.ac_unit),
            onPressed: () {},
          ),
          ActionButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
