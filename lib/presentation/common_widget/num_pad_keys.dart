import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NumkeyPad extends StatelessWidget {
  final Function(String) onKeyboardTap;
  final VoidCallback onBackPressTap;

  const NumkeyPad(
      {Key? key, required this.onKeyboardTap, required this.onBackPressTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [_keyButton("1"), _keyButton("2"), _keyButton("3")],
        ),
        Row(
          children: [_keyButton("4"), _keyButton("5"), _keyButton("6")],
        ),
        Row(
          children: [_keyButton("7"), _keyButton("8"), _keyButton("9")],
        ),
        Row(
          children: [_keyButton("."), _keyButton("0"), _clearButton()],
        ),
      ],
    );
  }

  Widget _keyButton(
    String value,
  ) {
    return Expanded(
      child: InkWell(
        onTap: () => onKeyboardTap(value),
        child: Container(
          decoration:
              BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey)),
          alignment: Alignment.center,
          height: 70,
          child: Text(
            value,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _clearButton() {
    return Expanded(
      child: InkWell(
        onTap: onBackPressTap,
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.grey)),
            alignment: Alignment.center,
            height: 70,
            width: 50,
            child: Icon(FontAwesomeIcons.backspace)),
      ),
    );
  }
}
