import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TransactionChartUiModel extends Equatable {
  final Color color;
  final String categoryName;
  final double percent;

  TransactionChartUiModel(
      {required this.color, required this.categoryName, required this.percent});

  @override
  List<Object?> get props => [color, categoryName, percent];
}
