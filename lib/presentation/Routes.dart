import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/presentation/journeys/login/login_screen.dart';
import 'package:finq/presentation/journeys/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings settings) => {
        RouteList.initial: (context) => OnboardingScreen(),
        RouteList.login: (context) => LoginScreen()
      };
}
