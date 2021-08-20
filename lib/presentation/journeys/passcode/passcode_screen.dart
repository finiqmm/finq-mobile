import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/journeys/passcode/passcode_option.dart';
import 'package:finq/presentation/journeys/passcode/passcode_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PasscodeScreen extends StatefulWidget {
  final PasscodeEntryOption entryOption;

  PasscodeScreen({required this.entryOption});

  @override
  _PasscodeScreenState createState() => _PasscodeScreenState();
}

class _PasscodeScreenState extends State<PasscodeScreen> {
  PasscodeCubit get _passcodeCubit => context.read<PasscodeCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PasscodeCubit, PasscodeState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Enter your current Pin.'),
              PasscodeTextField(
                isAbsorberEnabled: true,
                onTextChanged: (passcode) {
                  if (widget.entryOption ==
                      PasscodeEntryOption.passcodeRemove) {
                    _passcodeCubit.remove(passcode);
                  } else if (widget.entryOption ==
                      PasscodeEntryOption.passcodeVerificaion) {
                    _passcodeCubit.isPasscodeMatch(passcode);
                  } else {
                    _passcodeCubit.save(passcode);
                  }
                },
              ),
            ],
          );
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
