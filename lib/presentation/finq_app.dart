import 'package:finq/common/constants/languages.dart';
import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/common/screenutil/screenutil.dart';
import 'package:finq/di/injectable.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Routes.dart';
import 'app_localizations.dart';
import 'fade_page_route_builder.dart';
import 'main_provider_dependencies.dart';

class FinqApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MainProviderDependencies(
      child: BlocBuilder<ThemeCubit, ThemeBrightness>(
        builder: (context, theme) {
          return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              if (state is LanguageLoaded) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Finq App',
                  theme: theme == ThemeBrightness.dark
                      ? ThemeManager.createTheme(AppThemeDark())
                      : ThemeManager.createTheme(AppThemeLight()),
                  locale: state.locale,
                  supportedLocales:
                      Languages.languages.map((e) => Locale(e.code)).toList(),
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate
                  ],
                  builder: (context, child) => child!,
                  initialRoute: RouteList.initial,
                  onGenerateRoute: (RouteSettings settings) {
                    final routes = Routes.getRoutes(settings);
                    final WidgetBuilder? builder = routes[settings.name];
                    return FadePageRouteBuilder(
                      builder: builder!,
                      settings: settings,
                    );
                  },
                );
              }
              return SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
