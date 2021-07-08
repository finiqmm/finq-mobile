import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/domain/entities/article_entity.dart';
import 'package:finq/presentation/journeys/add_transaction/add_transaction.dart';
import 'package:finq/presentation/journeys/add_transaction/add_transaction_screen.dart';
import 'package:finq/presentation/journeys/articles/article_detail_screen.dart';
import 'package:finq/presentation/journeys/login/login_screen.dart';
import 'package:finq/presentation/journeys/main/main_screen.dart';
import 'package:finq/presentation/journeys/onboarding/onboarding_screen.dart';
import 'package:finq/presentation/journeys/profile/profile_screen.dart';
import 'package:finq/presentation/journeys/splash/splash_screen.dart';
import 'package:finq/presentation/models/transaction_action_state.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings settings) => {
        RouteList.initial: (context) => SplashScreen(),
        RouteList.login: (context) => LoginScreen(),
        RouteList.onboarding: (context) => OnboardingScreen(),
        RouteList.main: (context) => MainScreen(),
        RouteList.profile: (context) => ProfileScreen(),
        RouteList.add_transaction: (context) => AddTransactionScreen(
            transactionActionModel:
                settings.arguments as TransactionActionModel),
        RouteList.article_detail: (context) => ArticleDetaiScreen(
              article: settings.arguments as ArticleEntity,
            ),
      };
}
