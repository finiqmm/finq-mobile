import 'package:finq/di/get_it.dart';
import 'package:finq/presentation/bloc/profile/profile_bloc.dart';
import 'package:finq/presentation/journeys/main/main_bottom_navigation_bar.dart';
import 'package:finq/presentation/journeys/main/main_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPage = 0;
  late final ProfileBloc profileBloc;
  @override
  void initState() {
    super.initState();
    profileBloc = getItInstance<ProfileBloc>();
  }

  @override
  void dispose() {
    profileBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileBloc,
      child: Scaffold(
        body: mainScreens[_selectedPage],
        bottomNavigationBar: MainBottomNavigationBar(
          onSelectedIndexChange: (index) {
            setState(() {
              _selectedPage = index;
            });
          },
        ),
      ),
    );
  }
}
