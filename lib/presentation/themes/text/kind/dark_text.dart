import 'package:finq/presentation/themes/text/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemeDark implements ITextTheme {
  @override
  late TextTheme data;
  final Color? primaryColor;

  TextThemeDark(this.primaryColor) {
    data = TextTheme(
      headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
      subtitle1: TextStyle(fontSize: 16.0),
    ).apply(bodyColor: primaryColor);

    fontFamily = GoogleFonts.notoSans().fontFamily;
  }
  @override
  TextStyle? bodyText1;

  @override
  TextStyle? bodyText2;

  @override
  TextStyle? headline1;

  @override
  TextStyle? headline2;

  @override
  TextStyle? headline3;

  @override
  TextStyle? headline4;

  @override
  TextStyle? headline5;

  @override
  TextStyle? headline6;

  @override
  TextStyle? subtitle1;

  @override
  TextStyle? subtitle2;

  @override
  String? fontFamily;
}
