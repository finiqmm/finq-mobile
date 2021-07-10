import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoneyFormatter {
  MoneyFormatter._();

  static String formatMoney(String amount) {
    final _oCcy = new NumberFormat("#,##0.00");

    String formatted = _oCcy.format(amount);
    return formatted;
  }
}

class FinQDateUtil {
  FinQDateUtil._();

  static DateTimeRange getCurrentMonthDateRange() {
    final startDate = DateTime(DateTime.now().year, DateTime.now().month);
    final endDate = DateTime(DateTime.now().year, DateTime.now().month + 1);

    return DateTimeRange(start: startDate, end: endDate);
  }
}
