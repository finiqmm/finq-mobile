import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/common/screenutil/screenutil.dart';
import 'package:finq/di/get_it.dart';
import 'package:finq/presentation/bloc/app/app_bloc.dart';
import 'package:finq/presentation/journeys/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Routes.dart';
import 'bloc/onboarding/onboarding_bloc.dart';
import 'fade_page_route_builder.dart';

class FinqApp extends StatefulWidget {
  FinqApp({Key? key}) : super(key: key);

  @override
  _FinqAppState createState() => _FinqAppState();
}

class _FinqAppState extends State<FinqApp> {
  late final AppBloc appBloc;

  @override
  void initState() {
    super.initState();
    appBloc = getItInstance<AppBloc>();
    appBloc.add(IsUserFinishedOnboarding());
  }

  @override
  void dispose() {
    appBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();

  return BlocProvider(
        create: (context) => appBloc,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Finq App',
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
        ));
  }
}
