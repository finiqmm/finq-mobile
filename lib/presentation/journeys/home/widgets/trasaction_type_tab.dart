import 'package:flutter/material.dart';

class TransactionTypeTab extends StatelessWidget {
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
        child: DefaultTabController(
          length: 2,
          initialIndex: 1,
          child: TabBar(tabs: [
            _buildRichTextTab(context, 'Income', '400000'),
            _buildRichTextTab(context, 'Expense', '400000')
          ]),
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
