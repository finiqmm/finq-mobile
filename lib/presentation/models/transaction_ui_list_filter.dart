import 'package:finq/common/constants/money_formatter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum TransactionUiListFilter { DAILY, WEEKLY, MONTHLY }

extension TransactionUiListFilterExtension on TransactionUiListFilter {
  String get name => describeEnum(this);
  String get displayTitle {
    switch (this) {
      case TransactionUiListFilter.MONTHLY:
        return 'Monthly';
      case TransactionUiListFilter.WEEKLY:
        return 'Weekly';
      case TransactionUiListFilter.DAILY:
        return 'Daily';
      default:
        throw Exception('Filter is null');
    }
  }
}

TransactionUiListFilter getFilterEnum(String value) {
  switch (value) {
    case 'Monthly':
      return TransactionUiListFilter.MONTHLY;
    case 'Weekly':
      return TransactionUiListFilter.WEEKLY;
    case 'Daily':
      return TransactionUiListFilter.DAILY;
    default:
      return TransactionUiListFilter.DAILY;
  }
}

DateTimeRange getDateTimeRange(String value) {
  switch (value) {
    case 'Monthly':
      return FinQDateUtil.getRangeForMonthlyFilter();
    case 'Weekly':
      return FinQDateUtil.getRangeForMonthlyFilter();
    case 'Daily':
      return FinQDateUtil.getCurrentMonthDateRange();

    default:
      return FinQDateUtil.getRangeForMonthlyFilter();
  }
}
