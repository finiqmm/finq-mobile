import 'dart:math';

import 'package:finq/domain/entities/transaction_entity.dart';
import 'package:collection/collection.dart';
import 'package:finq/presentation/models/transaction_ui_chart_model.dart';
import 'package:flutter/material.dart';

class TransactionChartUiModelMapper {
  List<TransactionChartUiModel> from(List<TransactionEntity> entities) {
    final totalAmount = entities.fold<double>(
        0, (previousValue, element) => previousValue + element.amount);
    final entitiesByName =
        groupBy(entities, (TransactionEntity e) => e.categoryName);
    return entitiesByName
        .map((name, transactions) {
          final totalAmountOfItem = transactions.fold<double>(
              0, (previousValue, element) => previousValue + element.amount);
          var chartItemDate = TransactionChartUiModel(
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              categoryName: name,
              percent: (totalAmountOfItem / totalAmount) * 100);
          return MapEntry(name, chartItemDate);
        })
        .values
        .toList();
  }
}
