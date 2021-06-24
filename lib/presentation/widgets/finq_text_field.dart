import 'package:finq/presentation/colors/finq_colors.dart';
import 'package:flutter/material.dart';

import 'finq_text.dart';

class FinQTextField extends StatelessWidget {
  FinQTextField({
    this.controller,
    required this.label,
  });
  final TextEditingController? controller;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FinQText(
          title: label,
          color: FinQColors.black,
          fontWeight: FontWeight.bold,
          size: 14,
        ),
        SizedBox(
          height: 8.0,
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              )),
        ),
      ],
    );
  }
}
