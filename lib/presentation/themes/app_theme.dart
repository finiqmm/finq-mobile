import 'package:finq/presentation/themes/colors/color_manager.dart';
import 'package:finq/presentation/themes/colors/kind/dark_color.dart';
import 'package:finq/presentation/themes/colors/kind/light_color.dart';
import 'package:finq/presentation/themes/text/kind/dark_text.dart';
import 'package:finq/presentation/themes/text/kind/light_text.dart';
import 'package:finq/presentation/themes/text/text_theme.dart';
import 'package:flutter/material.dart';

abstract class ITheme {
  IColors get colors;
  ITextTheme get textTheme;
}

abstract class ThemeManager {
  static ThemeData createTheme(ITheme theme) {
    return ThemeData(
      useMaterial3: false,
        fontFamily: theme.textTheme.fontFamily,
        textTheme: theme.textTheme.data,
        cardColor: theme.colors.colorScheme?.onSecondary,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: theme.colors.colorScheme?.secondary,
            unselectedItemColor: theme.colors.bottomNavBarNormalColor),
        scaffoldBackgroundColor: theme.colors.scaffoldBackgroundColor,
        colorScheme: theme.colors.colorScheme);
  }
}

class AppThemeDark extends ITheme {
  @override
  IColors get colors => DarkColors();

  @override
  ITextTheme get textTheme => TextThemeDark(colors.colors.mediumGrey);
}

class AppThemeLight extends ITheme {
  @override
  IColors get colors => LightColors();

  @override
  ITextTheme get textTheme => TextThemeLight(colors.colors.lightBlack);
}
