import 'package:finq/presentation/utils/passcode_util.dart';
import 'package:flutter/material.dart';

class TextFieldBox extends StatefulWidget {
  final BlockTextChangedCallback onBlockTextChanged;
  final FocusNode focusNode;
  final int boxPosition;
  final bool isAborbPointerEnable;

  TextFieldBox(
      {required this.onBlockTextChanged,
      required this.focusNode,
      required this.boxPosition,
      required this.isAborbPointerEnable});

  @override
  _TextFieldBoxState createState() => _TextFieldBoxState();
}

class _TextFieldBoxState extends State<TextFieldBox> {
  TextEditingController? controller;
  String previousText = "";

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: AbsorbPointer(
                  absorbing: widget.isAborbPointerEnable,
                  child: TextField(
                    autofocus: true,
                    focusNode: widget.focusNode,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        widget.onBlockTextChanged("", widget.boxPosition);
                      } else {
                        widget.onBlockTextChanged(
                            value[value.length - 1], widget.boxPosition);
                      }
                    },
                    textAlign: TextAlign.center,
                    controller: controller,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      hintText: '',
                      counterText: '',
                      counterStyle: TextStyle(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.18,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
    );
  }
}
