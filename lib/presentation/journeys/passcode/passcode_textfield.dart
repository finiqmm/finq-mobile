import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/journeys/passcode/passcode_textfield_box.dart';
import 'package:finq/presentation/utils/passcode_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasscodeTextField extends StatefulWidget {
  final PasscodeChangedCallback onTextChanged;
  final bool isAbsorberEnabled;

  PasscodeTextField(
      {required this.onTextChanged, required this.isAbsorberEnabled});
  @override
  _PasscodeTextFieldState createState() => _PasscodeTextFieldState();
}

class _PasscodeTextFieldState extends State<PasscodeTextField> {
  late List<FocusNode> focusNodes;
  Map<int, String> passcode = {};

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(4, (index) => FocusNode());
  }

  @override
  void dispose() {
    super.dispose();

    //  focusNodes.forEach((node) {
    //                         node.unfocus();
    //                       });
    //                       FocusScope.of(context).requestFocus(focusNodes[0]);
    focusNodes.forEach((node) {
      node.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: List.generate(
          4,
          (index) => MultiBlocListener(
                  listeners: [
                    BlocListener<PincodeValidationCubit,
                        PincodeValidationState>(
                      listener: (context, state) {
                        if (state is PinValidationProgress ||
                            state is PincodeValidationFailed ||
                            state is PincodeValidationSuccess) {
                          focusNodes.forEach((node) {
                            node.unfocus();
                          });
                          FocusScope.of(context).requestFocus(focusNodes[0]);
                        }
                      },
                    ),
                    BlocListener<PincodeCubit, PincodeState>(
                      listener: (context, state) {
                        if (state is PincodeFailed) {
                          focusNodes.forEach((node) {
                            node.unfocus();
                          });
                          FocusScope.of(context).requestFocus(focusNodes[0]);
                        }
                      },
                    ),
                  ],
                  child: TextFieldBox(
                    boxPosition: index,
                    isAborbPointerEnable: widget.isAbsorberEnabled,
                    focusNode: focusNodes[index],
                    onBlockTextChanged: (String blockText, int blockPosition) {
                      if (blockText == "") {
                        if (blockPosition > 0) {
                          focusNodes[blockPosition].unfocus();
                          FocusScope.of(context)
                              .requestFocus(focusNodes[blockPosition - 1]);
                        }
                      } else if (blockPosition < focusNodes.length - 1) {
                        focusNodes[blockPosition].unfocus();

                        FocusScope.of(context)
                            .requestFocus(focusNodes[blockPosition + 1]);
                      } else if (blockPosition == focusNodes.length - 1) {
                        focusNodes[blockPosition].unfocus();
                      }
                      passcode[blockPosition] = blockText;
                      if (passcode.length == 4) {
                        debugPrint("Passcode" + passcode.toString());
                        widget.onTextChanged(passcode.values.join());
                        passcode.clear();
                      }
                    },
                  ))),
    );
  }
}
