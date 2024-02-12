import 'package:finq/presentation/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  String t(BuildContext context) {
    return AppLocalizations.of(context)?.translate(this) ?? '';
  }

  bool isGreatherThan(String abc) {
    return true;
  }
}

extension BuildContenxtExt on BuildContext {
  Color getCashColor(String incomeAmount, String expenseAmount) {
    var income = double.tryParse(incomeAmount) ?? 0.0;
    var expense = double.tryParse(expenseAmount) ?? 0.0;

    if (income > expense) {
      return Theme.of(this).primaryColor;
    } else {
      return Colors.redAccent;
    }
  }
}
