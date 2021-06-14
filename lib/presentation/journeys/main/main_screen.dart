import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/di/get_it.dart';
import 'package:finq/presentation/bloc/app/app_bloc.dart';
import 'package:finq/presentation/bloc/onboarding/onboarding_bloc.dart';
import 'package:finq/presentation/journeys/main/main_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final AppBloc _appBloc;

  @override
  void initState() {
    super.initState();
    _appBloc = getItInstance<AppBloc>();
    _appBloc.add(IsUserFinishedOnboarding());
  }

  @override
  void dispose() {
    _appBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _appBloc,
      child: BlocConsumer<AppBloc, AppState>(
        listenWhen: (previous, current) => current is FirstTimeUser,
        listener: (context, state) {
          if (state is FirstTimeUser) {
            debugPrint('State ${state.toString()}');

            Navigator.pushNamedAndRemoveUntil(
                context, RouteList.onboarding, (route) => false);
          }
        },
        buildWhen: (previous, current) => current is OnboardingPassed,
        builder: (context, state) {
          // debugPrint('State ${state.toString()}Build ');

          return Scaffold(
            appBar: AppBar(),
            body: Container(),
            bottomNavigationBar: MainBottomNavigationBar(
              onSelectedIndexChange: (index) {},
            ),
          );
        },
      ),
    );
  }
}
