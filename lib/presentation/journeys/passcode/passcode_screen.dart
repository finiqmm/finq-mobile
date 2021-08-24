import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/di/get_it.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/journeys/passcode/passcode_option.dart';
import 'package:finq/presentation/journeys/passcode/passcode_textfield.dart';
import 'package:finq/presentation/journeys/passcode/widgets/passcode_text_title.dart';
import 'package:finq/presentation/utils/passcode_util.dart';
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
  PincodeCubit get _pincodeCubit => context.read<PincodeCubit>();

  late PincodeValidationCubit _pinValidationCubit;

  @override
  void initState() {
    super.initState();
    _pinValidationCubit = getItInstance<PincodeValidationCubit>();
  }

  @override
  void dispose() {
    _pinValidationCubit.close();
    FocusScope.of(context).requestFocus(FocusNode());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider.value(
        value: _pinValidationCubit,
        child: MultiBlocListener(
          listeners: [
            BlocListener<PincodeCubit, PincodeState>(
              listenWhen: (previous, current) =>
                  current is PincodeFailed || current is PincodeSuccess,
              listener: (context, state) {
                if (state is PincodeFailed) {
                  Fluttertoast.showToast(msg: state.reason);
                  return;
                }
                if (state is PincodeSuccess) {
                  if (state.isNavigateToHomeScreen) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RouteList.main, (route) => false);
                  } else {
                    Navigator.pop(context);
                  }
                }
              },
            ),
            BlocListener<PincodeValidationCubit, PincodeValidationState>(
              listener: (context, state) {
                if (state is PincodeValidationFailed) {
                  Fluttertoast.showToast(msg: state.reason);
                }

                if (state is PincodeValidationSuccess) {
                  _pincodeCubit.save(state.pinCode);
                }
              },
            ),
          ],
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  PasscodeTextTitle(),
                  PasscodeTextField(
                      onTextChanged: (enterPin) {
                        if (widget.entryOption ==
                            PasscodeEntryOption.passcodeRemove) {
                          _pincodeCubit.remove(enterPin);
                        } else if (widget.entryOption ==
                            PasscodeEntryOption.passcodeVerificaion) {
                          _pincodeCubit.isPasscodeMatch(enterPin);
                        } else {
                          _pinValidationCubit.addPinEntry(enterPin);
                        }
                      },
                      isAbsorberEnabled: true)
                ],
              ),
              FractionallySizedBox(
                heightFactor: 0.4,
                alignment: Alignment.bottomCenter,
                child: WaveWidget(
                  waveAmplitude: 10,
                  size: Size(double.infinity, double.infinity),
                  config: CustomConfig(
                    gradients: [
                      [Color(0xFF3594DD), Color(0xFF4563DB)],
                      // [Color(0xFF4563DB), Color(0xFF3594DD)],
                      // [Color(0xFF5036D5), Color(0xFF5B16D0)],
                      [Color(0xFF5B16D0), Color(0xFF3594DD)],
                    ],
                    durations: [35000, 19440],
                    heightPercentages: [0.20, 0.23],
                    blur: MaskFilter.blur(BlurStyle.solid, 10),
                    gradientBegin: Alignment.bottomLeft,
                    gradientEnd: Alignment.topRight,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
