import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/domain/entities/transaction_entity.dart';
import 'package:finq/presentation/models/transaction_ui_model.dart';
import 'package:finq/common/extension/int_extension.dart';
import 'package:supercharged/supercharged.dart';

class TransactionUiModelMapper {
  List<TransactionUiModel> from(List<TransactionEntity> entities) {
   
    final entitiesByDate = entities.groupBy(
        (element) => element.transactionDate,
        valueTransform: (p) => p);

    return entitiesByDate
        .map((date, aa) {
          final totalIncomeAmount = aa
              .where((element) =>
                  element.transactionType == TransactionType.INCOME)
              .fold<double>(0,
                  (previousValue, element) => previousValue + element.amount);
          final totalExpenseAmount = aa
              .where((element) =>
                  element.transactionType == TransactionType.EXPENSE)
              .fold<double>(0,
                  (previousValue, element) => previousValue + element.amount);

          var value = TransactionUiModel(
              transactionDate: date.convertReadableDate(),
              totalIncomeAmount: totalIncomeAmount.toString(),
              totalExpenseAmount: totalExpenseAmount.toString(),
              transactionItems: aa);
          return MapEntry(date, value);
        })
        .values
        .toList();
  }
}
