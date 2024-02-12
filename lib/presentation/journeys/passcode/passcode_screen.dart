import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/di/injectable.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/journeys/passcode/passcode_option.dart';
import 'package:finq/presentation/journeys/passcode/widgets/pin_code_bloc_widget.dart';
import 'package:finq/presentation/journeys/passcode/widgets/passcode_text_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
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

  TextEditingController? _pinEditingController;

  /// Control whether show the obscureCode.

  @override
  void initState() {
    super.initState();
    _pinValidationCubit = getItInstance<PincodeValidationCubit>();
    _pinEditingController = TextEditingController();
   
  }

  @override
  void dispose() {
    _pinValidationCubit.close();
    _pinEditingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider.value(
        value: _pinValidationCubit,
        child: PincodeBlocWidget(
          onFailedState: (reason) => Fluttertoast.showToast(msg: reason),
          onSuccessState: (isNavigateToHome) => isNavigateToHome
              ? Navigator.pushNamedAndRemoveUntil(
                  context, RouteList.main, (route) => false)
              : Navigator.pop(context),
          onValidationSuccess: (pin) => _pincodeCubit.save(pin),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  PasscodeTextTitle(),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: PinInputTextField(
                      pinLength: 4,
                      controller: _pinEditingController,
                      textInputAction: TextInputAction.go,
                      enabled: true,
                      keyboardType: TextInputType.number,
                      enableInteractiveSelection: false,
                      decoration: UnderlineDecoration(
                        colorBuilder: PinListenColorBuilder(
                            Colors.cyan, Theme.of(context).primaryColor),
                      ),
                      onSubmit: (pin) {
                        if (pin.length != 4) {
                          return;
                        }
                        debugPrint('PasscodePin $pin');
                        if (widget.entryOption ==
                            PasscodeEntryOption.passcodeRemove) {
                          _pincodeCubit.remove(pin);
                        } else if (widget.entryOption ==
                            PasscodeEntryOption.passcodeVerificaion) {
                          _pincodeCubit.isPasscodeMatch(pin);
                        } else {
                          _pinValidationCubit.addPinEntry(pin);
                        }
                        _pinEditingController?.clear();
                      },
                      cursor: Cursor(
                        width: 2,
                        color: Colors.lightBlue,
                        radius: Radius.circular(1),
                        enabled: true,
                      ),
                    ),
                  )
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
