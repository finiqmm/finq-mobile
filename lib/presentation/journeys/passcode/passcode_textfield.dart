import 'package:finq/presentation/journeys/passcode/passcode_textfield_box.dart';
import 'package:finq/presentation/utils/passcode_util.dart';
import 'package:flutter/material.dart';

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
          (index) => TextFieldBox(
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
                    focusNodes.forEach((node) {
                      
                    });
                    widget.onTextChanged(passcode.values.join());
                  }
                },
              )),
    );
  }
}
