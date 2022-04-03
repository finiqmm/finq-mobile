import 'package:finq/presentation/models/transaction_ui_chart_model.dart';
import 'package:fl_chart/fl_chart.dart';

List<PieChartSectionData> getSections(
        int? touchIndex, List<TransactionChartUiModel> entities) =>
    entities
        .asMap()
        .map<int, PieChartSectionData>((index, data) {
          final isTouched = index == touchIndex;
          final double radius = isTouched ? 25 : 20;
          final value = PieChartSectionData(
              color: data.color,
              value: data.percent,
              radius: radius,
              title: '');
          return MapEntry(index, value);
        })
        .values
        .toList();
