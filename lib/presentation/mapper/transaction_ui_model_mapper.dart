import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/domain/entities/transaction_entity.dart';
import 'package:finq/presentation/models/transaction_ui_list_filter.dart';
import 'package:finq/presentation/models/transaction_ui_model.dart';
import 'package:finq/common/extension/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supercharged/supercharged.dart';

class TransactionUiModelMapper {
  List<TransactionUiModel> from(
      List<TransactionEntity> entities, TransactionUiListFilter filter) {
    Map<dynamic, List<TransactionEntity>> entitiesByFilter;
    if (filter == TransactionUiListFilter.MONTHLY) {
      entitiesByFilter = entities.groupBy(
          (element) => element.transactionDate.month,
          valueTransform: (p) => p);
    } else if (filter == TransactionUiListFilter.WEEKLY) {
      entitiesByFilter = entities.groupBy((element) {
        final transDate = element.transactionDate;
        return DateTimeRange(
            start: transDate.subtract(Duration(days: transDate.weekday - 1)),
            end: transDate.add(Duration(days: 7 - transDate.weekday)));
      }, valueTransform: (p) => p);
    } else {
      entitiesByFilter = entities.groupBy((element) => element.transactionDate,
          valueTransform: (p) => p);
    }

   
    // debugPrint('Mapper' + entitiesByFilter.keys.toString());

    return entitiesByFilter
        .map((date, items) {
          final totalIncomeAmount = items
              .where((element) =>
                  element.transactionType == TransactionType.INCOME)
              .fold<double>(0,
                  (previousValue, element) => previousValue + element.amount);
          final totalExpenseAmount = items
              .where((element) =>
                  element.transactionType == TransactionType.EXPENSE)
              .fold<double>(0,
                  (previousValue, element) => previousValue + element.amount);

          var value = TransactionUiModel(
              transactionDate: mapFilterKey(date, filter),
              totalIncomeAmount: totalIncomeAmount.convertToCurrency(),
              totalExpenseAmount: totalExpenseAmount.convertToCurrency(),
              transactionItems:
                  filter == TransactionUiListFilter.DAILY ? items : []);
          return MapEntry(date, value);
        })
        .values
        .toList();
  }

  String mapFilterKey(Object key, TransactionUiListFilter filter) {
    if (filter == TransactionUiListFilter.DAILY) {
      return (key as DateTime).convertReadableDate();
    } else if (filter == TransactionUiListFilter.MONTHLY) {
      return DateFormat('MMM').format(DateTime(0, key as int));
    }
    final weekRange = (key as DateTimeRange);
    return '${weekRange.start.convertMonthDate()} - ${weekRange.end.convertMonthDate()}';
  }
}
