import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/presentation/bloc/app/app_bloc.dart';
import 'package:finq/presentation/journeys/login/login_screen.dart';
import 'package:finq/presentation/journeys/main/main_screen.dart';
import 'package:finq/presentation/journeys/onboarding/onboarding_screen.dart';
import 'package:finq/presentation/journeys/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings settings) => {
        RouteList.initial: (context) => SplashScreen(),
        RouteList.login: (context) => LoginScreen(),
        RouteList.onboarding: (context) => OnboardingScreen(),
        RouteList.main: (context) => MainScreen(),
      };
}
