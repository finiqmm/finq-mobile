import 'dart:math';

import 'package:flutter/material.dart';


class PieData {
  static List<Data> data = [
    Data(
        name: 'Shopping',
        percent: 20,
        color: Color(Random().nextInt(0xFF0E0D0D))),
    Data(
        name: 'Device',
        percent: 20,
        color: Color(Random().nextInt(0xFF0E0D0D))),
    Data(
        name: 'Grocery',
        percent: 20,
        color: Color(Random().nextInt(0xFF0E0D0D))),
    Data(
        name: 'Other', percent: 20, color: Color(Random().nextInt(0xFF0E0D0D))),
    Data(
        name: 'Salary',
        percent: 20,
        color: Color(Random().nextInt(0xFF0E0D0D))),
    Data(
        name: 'Award', percent: 20, color: Color(Random().nextInt(0xFF0E0D0D))),
  ];
}

class Data {
  final String name;

  final double percent;

  final Color color;

  Data({required this.name, required this.percent, required this.color});
}
