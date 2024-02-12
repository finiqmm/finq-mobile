import 'dart:ui';

import 'package:finq/presentation/themes/colors/color_manager.dart';
import 'package:flutter/src/material/color_scheme.dart';
import '../color_manager.dart';

class LightColors implements IColors {
  @override
  Color? appBarColor;

  @override
  Brightness? brightness;

  @override
  ColorScheme? colorScheme;

  @override
  Color? scaffoldBackgroundColor;

  @override
  Color? tabBarColor;

  @override
  Color? tabbarNormalColor;

  @override
  Color? tabbarSelectedColor;

  @override
  Color? bottomNavBarColor;

  @override
  Color? bottomNavBarNormalColor;

  @override
  Color? bottomNavBarSelectedColor;

  @override
  AppColors get colors => AppColors();

  LightColors() {
    bottomNavBarNormalColor = colors.darkGrey;
    colorScheme = ColorScheme.light().copyWith(
        primary: colors.denim,
        onPrimary: colors.white,
        secondary: colors.pacificBlue,
        onSecondary: colors.white,
        onSurface: colors.darkGrey);
    brightness = Brightness.dark;
  }
}
