import 'package:flutter/material.dart';

import 'number_button.dart';

class NumberTableWidget extends StatelessWidget {
  final Function(String) onNumberPressed;
  final Function onClearPressed;
  NumberTableWidget({required this.onNumberPressed,required  this.onClearPressed});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          NumberButton('1', () => onNumberPressed('1')),
          NumberButton('2', () => onNumberPressed('2')),
          NumberButton('3', () => onNumberPressed('3'))
        ]),
        TableRow(children: [
          NumberButton('4', () => onNumberPressed('4')),
          NumberButton('5', () => onNumberPressed('5')),
          NumberButton('6', () => onNumberPressed('6'))
        ]),
        TableRow(children: [
          NumberButton('7', () => onNumberPressed('7')),
          NumberButton('8', () => onNumberPressed('8')),
          NumberButton('9', () => onNumberPressed('9'))
        ]),
        TableRow(children: [
          NumberButton('.', () {
            onNumberPressed('.');
          }),
          NumberButton('0', () => onNumberPressed('0')),
          NumberButton('Clear', () => onClearPressed())
        ]),
      ],
    );
  }
}
