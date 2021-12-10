import 'dart:ui';

import 'package:finq/presentation/themes/colors/color_manager.dart';
import 'package:flutter/material.dart';

class DarkColors implements IColors {
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

  DarkColors() {
    appBarColor = colors.darkGrey;
    scaffoldBackgroundColor = colors.darkGrey;
    tabbarNormalColor = colors.lighterGrey;
    colorScheme = ColorScheme.dark()
        .copyWith(onPrimary: colors.white, onSecondary: colors.darkGrey);
    brightness = Brightness.dark;
  }

  
}
