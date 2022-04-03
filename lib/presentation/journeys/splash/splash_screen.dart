import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/presentation/bloc/app/app_bloc.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/journeys/passcode/passcode_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AppBloc, AppState>(
          listener: (context, state) {
            if (state is FirstTimeUser) {
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteList.onboarding, (route) => false);
            } else if (state is Authenticated) {
              //IsPasscodeExist check in bloc              
              
            } else if (state is UnAuthenticated) {
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteList.login, (route) => false);
            }
          },
        ),
        BlocListener<PincodeCubit, PincodeState>(
          listenWhen: (previous, current) => current is IsPasscodeExist,
          listener: (context, state) {
            if (state is IsPasscodeExist) {
              debugPrint("SplashsScree ${state.isExist}");
              if (state.isExist) {
                Navigator.pushNamedAndRemoveUntil(
                    context, RouteList.passcode, (route) => false,
                    arguments: PasscodeEntryOption.passcodeVerificaion);
              } else {
                Navigator.pushNamedAndRemoveUntil(
                    context, RouteList.main, (route) => false);
              }
            }
          },
        ),
      ],
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
   
  }
}
