import 'package:finq/presentation/app_localizations.dart';
import 'package:flutter/material.dart';

extension StringExtension on String {
  
  String t(BuildContext context) {
    return AppLocalizations.of(context)?.translate(this) ?? '';
  }
}
