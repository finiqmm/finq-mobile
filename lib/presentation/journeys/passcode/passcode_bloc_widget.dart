import 'package:dartz/dartz.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasscodeBlocWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onFailedState;

  PasscodeBlocWidget({required this.child, required this.onFailedState});
 
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PincodeValidationCubit, PincodeValidationState>(
          listener: (context, state) {
            if (state is PincodeFailed) {
              debugPrint('HelloTesting 1235');
              onFailedState();
            }
          },
        ),
        BlocListener<PincodeCubit, PincodeState>(
          listener: (context, state) {
            if (state is PinValidationProgress ||
                state is PincodeValidationFailed ||
                state is PincodeValidationSuccess) {
              

              onFailedState();
            }
          },
        ),
      ],
      child: child,
    );
  }
}
