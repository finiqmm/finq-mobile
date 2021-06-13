import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/common/screenutil/screenutil.dart';
import 'package:finq/presentation/journeys/main/main_screen.dart';
import 'package:flutter/material.dart';

import 'Routes.dart';
import 'fade_page_route_builder.dart';

class FinqApp extends StatefulWidget {
  FinqApp({Key? key}) : super(key: key);

  @override
  _FinqAppState createState() => _FinqAppState();
}

class _FinqAppState extends State<FinqApp> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
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
    );
  }
}
