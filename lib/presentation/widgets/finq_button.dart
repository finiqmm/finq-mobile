import 'package:flutter/material.dart';

class FinqButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  FinqButton({required this.onPressed, required this.text});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 46,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: Colors.redAccent),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }
}
