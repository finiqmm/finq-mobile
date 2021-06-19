import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static String convertMillisecondToString({int? milliSecond}) {
    try {
      var date = DateTime.fromMillisecondsSinceEpoch(milliSecond ?? 0);
      return DateFormat('dd/MM/yyyy').format(date);
    } on FormatException {
      return '';
    }
  }
}
