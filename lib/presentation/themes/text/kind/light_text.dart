import 'dart:ui';

import 'package:finq/presentation/themes/text/text_theme.dart';
import 'package:flutter/src/material/text_theme.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemeLight implements ITextTheme {
  @override
  TextStyle? bodyText1;

  @override
  TextStyle? bodyText2;

  @override
  late final TextTheme data;

  @override
  String? fontFamily;

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
  final Color? primaryColor;

  TextThemeLight(this.primaryColor) {
    data = TextTheme(
            headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            subtitle1: TextStyle(fontSize: 16))
        .apply(bodyColor: primaryColor);
    fontFamily = GoogleFonts.arvo().fontFamily;
  }
}
