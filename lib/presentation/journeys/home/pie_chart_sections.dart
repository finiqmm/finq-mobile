import 'package:finq/domain/entities/transaction_entity.dart';
import 'package:finq/presentation/journeys/home/pie_data.dart';
import 'package:finq/presentation/models/transaction_ui_chart_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// List<PieChartSectionData> getSections(int? touchIndex) => PieData.data
//     .asMap()
//     .map<int, PieChartSectionData>((index, data) {
//       final isTouched = index == touchIndex;
//       final double radius = isTouched ? 25 : 20;
//       final value = PieChartSectionData(
//         color: data.color,
//         value: data.percent,
//         radius: radius,
//         title: ''
//       );
//       return MapEntry(index, value);
//     })
//     .values
//     .toList();


    List<PieChartSectionData> getSections(int? touchIndex,List<TransactionChartUiModel> entities) => entities.
    asMap()
    .map<int, PieChartSectionData>((index, data) {
      final isTouched = index == touchIndex;
      final double radius = isTouched ? 25 : 20;
      final value = PieChartSectionData(
        color: data.color,
        value: data.percent,
        radius: radius,
        title: ''
      );
      return MapEntry(index, value);
    })
    .values
    .toList();
