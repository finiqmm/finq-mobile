import 'package:flutter/foundation.dart';

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
