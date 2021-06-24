import 'package:flutter/material.dart';

class FinqButton extends StatelessWidget {
  FinqButton(
      {required this.onPressed, required this.title, required this.width});
  final GestureTapCallback? onPressed;
  final String title;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.0,
      child: RaisedButton(
        onPressed: onPressed,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff7F7F7F), Color(0xff7F7F7F)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(8.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: width, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
