import 'package:finq/presentation/bloc/blocs.dart';
import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const Color white = Color(0xFFFFFFFF);
  // static const Color accent = Color(0xFF5A35F4);
  // static const Color primaryDark = Color(0xFF000000);

  static const Color vulcan = Color(0xFF141221);
  static const Color royalBlue = Color(0xFF604FEF);
}

finQTheme(Themes theme) => ThemeData(
    brightness: theme == Themes.dark ? Brightness.dark : Brightness.light,
    appBarTheme: AppBarTheme(elevation: 0),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    accentColor: AppColor.royalBlue,
    scaffoldBackgroundColor:
        theme == Themes.dark ? AppColor.vulcan : AppColor.white,
    primaryColor: theme == Themes.dark ? AppColor.vulcan : AppColor.white,
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.royalBlue, width: 2)),
        border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: AppColor.royalBlue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)))),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: AppColor.royalBlue)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColor.royalBlue,
        unselectedItemColor:
            theme == Themes.dark ? AppColor.white : AppColor.vulcan));
