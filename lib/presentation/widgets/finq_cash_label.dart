import 'package:flutter/material.dart';

class FinQCashLabel extends StatelessWidget {
  final String title;
  final GestureTapCallback? onPressed;
  final TextStyle textStyle;

  const FinQCashLabel(
      {Key? key,
      required this.title,
      required this.textStyle,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}
