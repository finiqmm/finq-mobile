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

extension DateExtension on DateTime? {
  String convertReadableDate() {
    return DateFormat('dd/MM/yyyy').format(this ?? DateTime.now());
  }
}

// extension NumFormat on num {
//   aa() {
//     NumberFormat.decimalPattern(this);
//   }
// }
