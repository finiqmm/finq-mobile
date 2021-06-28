import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  final String number;
  final Function onPressed;

  NumberButton(this.number, this.onPressed);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(12)),
        child: Text(
          number,
          textAlign: TextAlign.center,
          style:
              Theme.of(context).textTheme.button?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
