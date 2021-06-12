import 'package:finq/common/screenutil/screenutil.dart';
import 'package:finq/presentation/journeys/main/main_screen.dart';
import 'package:flutter/material.dart';

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
      home: MainScreen(),
    );
  }
}
