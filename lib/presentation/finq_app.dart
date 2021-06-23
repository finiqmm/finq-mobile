import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/common/screenutil/screenutil.dart';
import 'package:finq/di/get_it.dart';
import 'package:finq/presentation/bloc/app/app_bloc.dart';
import 'package:finq/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Routes.dart';
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
          theme: ThemeData(
              appBarTheme: AppBarTheme(elevation: 0),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              scaffoldBackgroundColor: Colors.white,
              accentColor: AppColor.accent,
              primaryColor: AppColor.primary,
              iconTheme: IconThemeData(
                color: Colors.red
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                      primary: AppColor.accent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(primary: AppColor.accent)),
              // buttonTheme: ElevatedButton.styleFrom(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(30.0),
              //     ),
              //     primary: Theme.of(context).accentColor,
              //   )

              // style: TextButton.styleFrom(
              //     textStyle: TextStyle(
              //       color: AppColor.accent
              //     ),
              //     onSurface: Colors.blueAccent,
              //     primary: Colors.green

              //   )
              // ),
              // buttonTheme: ButtonThemeData(te: ButtonTextTheme.accent),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: AppColor.accent,
                  unselectedItemColor: Colors.black)),
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
