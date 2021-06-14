import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/presentation/bloc/app/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        if (state is FirstTimeUser) {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteList.onboarding, (route) => false);
        } else if (state is Authenticated) {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteList.main, (route) => false);
        } else if (state is UnAuthenticated) {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteList.login, (route) => false);
        }
      },
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
