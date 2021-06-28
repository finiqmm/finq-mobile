import 'package:finq/presentation/bloc/blocs.dart';
import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const Color primary = Color(0xFFFFFFFF);
  static const Color accent = Color(0xFF5A35F4);
}

finQTheme(Themes theme) => ThemeData(
    brightness: theme == Themes.dark ? Brightness.dark : Brightness.light,
    appBarTheme: AppBarTheme(elevation: 0),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
    accentColor: AppColor.accent,
    primaryColor: AppColor.primary,
    iconTheme: IconThemeData(color: Colors.red),
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.accent, width: 2)),
        border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: AppColor.accent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)))),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: AppColor.accent)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColor.accent, unselectedItemColor: Colors.black));
