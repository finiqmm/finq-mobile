import 'package:finq/presentation/widgets/finq_button.dart';
import 'package:flutter/material.dart';

class ArticleErrorDialog extends StatelessWidget {
  final String message;
  final Function onPressed;

  ArticleErrorDialog(this.message, this.onPressed);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
          FinqButton(onPressed: () => onPressed(), text: 'Retry')
        ],
      ),
    );
  }
}
