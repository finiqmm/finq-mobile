import 'package:flutter/material.dart';

class FinQText extends StatelessWidget {
  FinQText(
      {required this.title,
      this.textAlign = TextAlign.start,
      this.onPressed,
      this.size = 16,
      this.color = const Color(0xff7F7F7F),
      this.fontWeight = FontWeight.normal});
  final String title;
  final GestureTapCallback? onPressed;
  final TextAlign? textAlign;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        title,
        textAlign: textAlign,
        style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight),
      ),
    );
  }
}
