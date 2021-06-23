import 'package:finq/common/constants/languages.dart';
import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/common/screenutil/screenutil.dart';
import 'package:finq/di/get_it.dart';
import 'package:finq/presentation/bloc/app/app_bloc.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Routes.dart';
import 'app_localizations.dart';
import 'fade_page_route_builder.dart';

class FinqApp extends StatefulWidget {
  FinqApp({Key? key}) : super(key: key);

  @override
  _FinqAppState createState() => _FinqAppState();
}

class _FinqAppState extends State<FinqApp> {
  late final AppBloc appBloc;
  late final LanguageBloc _languageBloc;

  @override
  void initState() {
    super.initState();
    appBloc = getItInstance<AppBloc>();
    _languageBloc = getItInstance<LanguageBloc>();
    appBloc.add(IsUserFinishedOnboarding());
    _languageBloc.add(LoadPreferredLanguageEvent());
  }

  @override
  void dispose() {
    appBloc.close();
    _languageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: appBloc,
        ),
        BlocProvider.value(
          value: _languageBloc,
        ),
      ],
      child: BlocProvider.value(
        value: _languageBloc,
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            if (state is LanguageLoaded) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Finq App',
                theme: ThemeData(
                    appBarTheme: AppBarTheme(elevation: 0),
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    scaffoldBackgroundColor: Colors.white,
                    accentColor: AppColor.accent,
                    primaryColor: AppColor.primary,
                    iconTheme: IconThemeData(color: Colors.red),
                    elevatedButtonTheme: ElevatedButtonThemeData(
                        style: ElevatedButton.styleFrom(
                            primary: AppColor.accent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)))),
                    textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(primary: AppColor.accent)),
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                        selectedItemColor: AppColor.accent,
                        unselectedItemColor: Colors.black)),
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
        ),
      ),
    );
  }
}
