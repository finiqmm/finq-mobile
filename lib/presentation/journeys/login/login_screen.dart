import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/common/constants/size_constants.dart';
import 'package:finq/di/injectable.dart';
import 'package:finq/presentation/bloc/auth/auth_bloc.dart';
import 'package:finq/presentation/common_widget/animated_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finq/common/extension/size_extension.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final AuthBloc authBloc;
  bool loginProgressComplete = true;
  @override
  void initState() {
    super.initState();
    authBloc = getItInstance<AuthBloc>();
  }

  @override
  void dispose() {
    authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: authBloc,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: RotatedBox(
                quarterTurns: 2,
                child: FractionallySizedBox(
                  heightFactor: 0.5,
                  alignment: Alignment.topCenter,
                  child: WaveWidget(
                    waveAmplitude: 10,
                    size: Size(double.infinity, double.infinity),
                    config: CustomConfig(
                      gradients: [
                        [Color(0xFF3594DD), Color(0xFF4563DB)],
                        [Color(0xFF5B16D0), Color(0xFF3594DD)],
                      ],
                      durations: [35000, 19440],
                      heightPercentages: [0.20, 0.23],
                      blur: MaskFilter.blur(BlurStyle.solid, 10),
                      gradientBegin: Alignment.bottomLeft,
                      gradientEnd: Alignment.topRight,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: Sizes.dimen_230.w,
                  height: Sizes.dimen_230.h,
                  child: Image.asset(
                    'assets/launcher_icon/app_icon.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                BlocListener<AuthBloc, AuthState>(
                    child: AnimatedLoadingButton(
                      title: 'SignIn With Google',
                      completeLoading: loginProgressComplete,
                      onPressed: () {
                        // Fluttertoast.showToast(msg: 'fwepf');
                        authBloc.add(SignInPressed());
                      },
                    ),
                    listenWhen: (previous, current) =>
                        current is SignInSuccess || current is SignInError,
                    listener: (context, state) {
                      if (state is SignInSuccess) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            RouteList.main, (route) => false);
                      }

                      if (state is SignInError) {
                        Fluttertoast.showToast(msg: state.message);
                        setState(() {
                          loginProgressComplete = true;
                        });
                      }
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
