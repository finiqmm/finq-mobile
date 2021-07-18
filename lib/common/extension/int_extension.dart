import 'package:intl/intl.dart';

extension IntExtension on int? {
  String millisecondToString() {
    try {
      var date = DateTime.fromMillisecondsSinceEpoch(this ?? 0);
      return DateFormat('dd/MM/yyyy').format(date);
    } on FormatException {
      return '';
    }
  }
}

extension DoubleExtension on double? {
  String convertToCurrency() {
    return NumberFormat.currency(name: '').format(this);
  }
}

extension DateExtension on DateTime? {
  String convertReadableDate() {
    return DateFormat('dd/MM/yyyy').format(this ?? DateTime.now());
  }

  DateTime getOnlyDate() {
    if (this != null) {
      return DateTime(this!.year, this!.month, this!.day);
    }
    final currentDate = DateTime.now();
    return DateTime(currentDate.year, currentDate.month, currentDate.day);
  }
}
