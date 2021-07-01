import 'package:flutter/material.dart';

class TransactionTableHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                const Color(0xFF3366FF),
                const Color(0xFF00CCFF),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Row(children: [
          Expanded(
            flex: 6,
            child: Container(),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "Income",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "Expenses",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0),
            ),
          ),
        ]));
  }
}
