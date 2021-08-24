import 'package:finq/presentation/bloc/pincode/pincode_validation/pincode_validation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasscodeTextTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PincodeValidationCubit, PincodeValidationState>(
      builder: (context, state) {
        if (state is PinValidationProgress) {
          return Text('Continue enter your pin');
        }

        return Text('Enter your pin.');
      },
    );
  }
}
