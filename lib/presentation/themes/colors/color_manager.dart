import 'package:flutter/material.dart';

@immutable
class AppColors {
  final Color white = Color(0xffffffff);
  final Color mediumGrey = Color(0xffa6bcd0);
  final Color mediumGreyBold = Color(0xff748a9d);
  final Color lighterGrey = Color(0xfff0f4f8);
  final Color lightGrey = Color(0xffdbe2ed);
  final Color darkerGrey = Color(0xff404e5a);
  final Color darkGrey = Color(0xff4e5d6a);

  final Color denim = Color(0xFF1564BF); //P
  final Color cornflowerBlue = Color(0xFF5E91F2); //PL
  final Color smalt = Color(0xFF003B8E); //PD

  final Color pacificBlue = Color(0xFF0288d1); //S
  final Color mayaBlue = Color(0xFF5EB8FF); //SL
  final Color cobalt = Color(0xFF005b9f); //SD



}

abstract class IColors {
  AppColors get colors;
  Color? scaffoldBackgroundColor;
  Color? appBarColor;
  Color? tabBarColor;
  Color? tabbarSelectedColor;
  Color? tabbarNormalColor;
  Color? bottomNavBarColor;
  Color? bottomNavBarSelectedColor;
  Color? bottomNavBarNormalColor;
  Brightness? brightness;

  ColorScheme? colorScheme;
}
