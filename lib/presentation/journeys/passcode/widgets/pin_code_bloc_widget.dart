import 'package:finq/presentation/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PincodeBlocWidget extends StatelessWidget {
  final Widget child;
  final Function(String) onFailedState;
  final Function(bool) onSuccessState;
  final Function(String) onValidationSuccess;

  PincodeBlocWidget(
      {required this.child,
      required this.onFailedState,
      required this.onSuccessState,
      required this.onValidationSuccess});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PincodeValidationCubit, PincodeValidationState>(
          listenWhen: (previous, current) => current is PincodeValidationFailed || current is PincodeValidationSuccess,
          listener: (context, state) {
            if (state is PincodeValidationFailed) onFailedState(state.reason);
            if (state is PincodeValidationSuccess) onValidationSuccess(state.pinCode);
          },
        ),
        BlocListener<PincodeCubit, PincodeState>(
          listenWhen: (previous, current) =>
              current is PincodeFailed || current is PincodeSuccess,
          listener: (context, state) {
            if (state is PincodeSuccess)
              onSuccessState(state.isNavigateToHomeScreen);

            if (state is PincodeFailed) onFailedState(state.reason);
          },
        ),
      ],
      child: child,
    );
  }
}
