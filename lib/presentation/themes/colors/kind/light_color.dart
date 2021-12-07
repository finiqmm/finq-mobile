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
  AppColors get colors => AppColors();

  LightColors() {
    appBarColor = colors.white;
    scaffoldBackgroundColor = colors.white;
    tabBarColor = colors.green;
    tabbarNormalColor = colors.darkerGrey;
    tabbarSelectedColor = colors.green;
    colorScheme = ColorScheme.light().copyWith(
        onPrimary: colors.green,
        onSecondary: colors.white,
        onSurface: colors.mediumGreyBold);
    brightness = Brightness.dark;
  }
}
