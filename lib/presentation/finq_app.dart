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
  late final ThemeCubit _themeCubit;
  late final PincodeCubit _passcodeCubit;

  @override
  void initState() {
    super.initState();
    appBloc = getItInstance<AppBloc>();
    _languageBloc = getItInstance<LanguageBloc>();
    _themeCubit = getItInstance<ThemeCubit>();
    _passcodeCubit = getItInstance<PincodeCubit>();
    appBloc.add(IsUserFinishedOnboarding());
    _languageBloc.add(LoadPreferredLanguageEvent());
    _themeCubit.loadPreferredTheme();
    _passcodeCubit.isAppLocked();
  }

  @override
  void dispose() {
    appBloc.close();
    _languageBloc.close();
    _themeCubit.close();
    _passcodeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>.value(
          value: appBloc,
        ),
        BlocProvider<LanguageBloc>.value(
          value: _languageBloc,
        ),
        BlocProvider<ThemeCubit>.value(
          value: _themeCubit,
        ),
        BlocProvider<PincodeCubit>.value(
          value: _passcodeCubit,
        ),
      ],
      child: BlocBuilder<ThemeCubit, Themes>(
        builder: (context, theme) {
          return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              if (state is LanguageLoaded) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Finq App',
                  theme: finQTheme(theme),
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
