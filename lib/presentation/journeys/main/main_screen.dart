import 'package:finq/presentation/journeys/main/main_bottom_navigation_bar.dart';
import 'package:finq/presentation/journeys/main/main_nav_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPage = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainScreens[_selectedPage],
      bottomNavigationBar: MainBottomNavigationBar(
        onSelectedIndexChange: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
      ),
    );
  }
}
