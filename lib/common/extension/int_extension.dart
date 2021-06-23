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
