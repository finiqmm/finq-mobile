import 'package:finq/common/constants/transaction_type.dart';
import 'package:finq/domain/entities/transaction_entity.dart';
import "package:collection/collection.dart";
import 'package:finq/presentation/models/transaction_ui_model.dart';
import 'package:finq/common/extension/int_extension.dart';

class TransactionUiModelMapper {
   List<TransactionUiModel> from(List<TransactionEntity> entities) {
    final entitiesByDate =
        groupBy(entities, (TransactionEntity e) => e.transactionDate);
   return entitiesByDate
        .map((date, transactionItems) {
          final totalIncomeAmount = transactionItems
              .where((element) =>
                  element.transactionType == TransactionType.INCOME)
              .fold<double>(0,
                  (previousValue, element) => previousValue + element.amount);
          final totalExpenseAmount = transactionItems
              .where((element) =>
                  element.transactionType == TransactionType.EXPENSE)
              .fold<double>(0,
                  (previousValue, element) => previousValue + element.amount);

          var value = TransactionUiModel(
              transactionDate: date.convertReadableDate(),
              totalIncomeAmount: totalIncomeAmount.toString(),
              totalExpenseAmount: totalExpenseAmount.toString(),
              transactionItems: transactionItems);
          return MapEntry(date, value);
        })
        .values
        .toList();
  }
}
