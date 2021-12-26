import 'package:finq/di/injectable.dart';
import 'package:finq/presentation/bloc/main_navbar/main_navbar_cubit.dart';
import 'package:finq/presentation/bloc/profile/profile_bloc.dart';
import 'package:finq/presentation/journeys/articles/article_screen.dart';
import 'package:finq/presentation/journeys/home/home_screen.dart';
import 'package:finq/presentation/journeys/main/main_bottom_navigation_bar.dart';
import 'package:finq/presentation/journeys/main/main_nav_bar.dart';
import 'package:finq/presentation/journeys/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final ProfileBloc profileBloc;
  late MainNavbarCubit mainNavbarCubit;
  @override
  void initState() {
    super.initState();
    profileBloc = getItInstance<ProfileBloc>();
    mainNavbarCubit = getItInstance<MainNavbarCubit>();
  }

  @override
  void dispose() {
    profileBloc.close();
    mainNavbarCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => profileBloc,
        ),
        BlocProvider(
          create: (context) => mainNavbarCubit,
        ),
      ],
      child: BlocBuilder<MainNavbarCubit, PageModel>(
        builder: (context, state) {
          return Scaffold(
            body: currentScreen(state.index),
            bottomNavigationBar: BlocBuilder<MainNavbarCubit, PageModel>(
              builder: (context, state) {
                return MainBottomNavigationBar(
                    selectedIndex: state.index,
                    onSelectedIndexChange: (index) {
                      mainNavbarCubit.selectPage(index);
                    });
              },
            ),
          );
        },
      ),
    );
  }

  Widget currentScreen(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return ArticleScreen();
      case 2:
        return SettingsScreen();
      default:
        return HomeScreen();
    }
  }
}
