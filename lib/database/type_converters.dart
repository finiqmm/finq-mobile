import 'package:finq/common/constants/transaction_type.dart';
import 'package:floor/floor.dart';

class DateTimeConverter extends TypeConverter<DateTime, int> {
  @override
  DateTime decode(int databaseValue) {
    return DateTime.fromMillisecondsSinceEpoch(databaseValue);
  }

  @override
  int encode(DateTime value) {
    return value.millisecondsSinceEpoch;
  }
}

class TransactionTypeConverter extends TypeConverter<TransactionType, int> {
  @override
  TransactionType decode(int databaseValue) {
    return databaseValue == 0
        ? TransactionType.EXPENSE
        : TransactionType.INCOME;
  }

  @override
  int encode(TransactionType value) {
    return value == TransactionType.EXPENSE ? 0 : 1;
  }
}
