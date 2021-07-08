import 'package:intl/intl.dart';

class MoneyFormatter {
  MoneyFormatter._();

  static String formatMoney(String amount) {
    final _oCcy = new NumberFormat("#,##0.00");

    String formatted = _oCcy.format(amount);
    return formatted;
  }
}
