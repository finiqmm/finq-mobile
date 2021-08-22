import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/journeys/passcode/passcode_option.dart';
import 'package:finq/presentation/journeys/passcode/passcode_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class PasscodeScreen extends StatefulWidget {
  final PasscodeEntryOption entryOption;

  PasscodeScreen({required this.entryOption});

  @override
  _PasscodeScreenState createState() => _PasscodeScreenState();
}

class _PasscodeScreenState extends State<PasscodeScreen> {
  PasscodeCubit get _passcodeCubit => context.read<PasscodeCubit>();

  String previousText = "";
  int passCodeEnterCount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<PasscodeCubit, PasscodeState>(
        builder: (context, state) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text('Enter your pin.'),
                  SizedBox(
                    height: 20,
                  ),
                  PasscodeTextField(
                      onTextChanged: (passcode) {}, isAbsorberEnabled: true),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              FractionallySizedBox(
                alignment: Alignment.bottomCenter,
                heightFactor: 0.4,
                child: WaveWidget(
                    waveAmplitude: 10,
                    config: CustomConfig(
                      gradients: [
                        [Color(0xFF3594DD), Color(0xFF4563DB)],
                        [Color(0xFF4563DB), Color(0xFF3594DD)],
                        [Color(0xFF5036D5), Color(0xFF5B16D0)],
                        [Color(0xFF5B16D0), Color(0xFF3594DD)],
                      ],
                      durations: [35000, 19440, 10800, 6000],
                      heightPercentages: [0.20, 0.23, 0.25, 0.30],
                      blur: MaskFilter.blur(BlurStyle.solid, 10),
                      gradientBegin: Alignment.bottomLeft,
                      gradientEnd: Alignment.topRight,
                    ),
                    size: Size(double.infinity, double.infinity)),
              ),
            ],
          );
          // return Column(
          //   mainAxisSize: MainAxisSize.min,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     // Text('Enter your current Pin.'),
          //     // PasscodeTextField(
          //     //   isAbsorberEnabled: true,
          //     //   onTextChanged: (passcode) {
          //     //     // if (widget.entryOption ==
          //     //     //     PasscodeEntryOption.passcodeRemove) {
          //     //     //   _passcodeCubit.remove(passcode);
          //     //     // } else if (widget.entryOption ==
          //     //     //     PasscodeEntryOption.passcodeVerificaion) {
          //     //     //   _passcodeCubit.isPasscodeMatch(passcode);
          //     //     // } else {
          //     //     //   if (passCodeEnterCount == 1) {
          //     //     //     previousText = passcode;
          //     //     //     passCodeEnterCount++;
          //     //     //     return;
          //     //     //   } else {
          //     //     //     if (previousText == passcode && passCodeEnterCount == 2) {
          //     //     //       _passcodeCubit.save(passcode);
          //     //     //     } else {
          //     //     //       Fluttertoast.showToast(msg: 'Password not match');
          //     //     //     }
          //     //     //   }
          //     //     // }
          //     //   },
          //     // ),
          //     // Expanded(child: Container(color: Colors.greenAccent))
          //   ],
          // );
        },
        listener: (context, state) {
          if (state is PasscodeSuccess) {
            if (state.isNavigateToHomeScreen) {
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteList.main, (route) => false);
            } else {
              Navigator.pop(context);
            }
          }
          if (state is PasscodeFailed) {
            Fluttertoast.showToast(msg: state.reason);
          }
        },
      ),
    );
  }
}
