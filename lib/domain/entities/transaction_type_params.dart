import 'package:equatable/equatable.dart';
import 'package:finq/common/constants/transaction_type.dart';

class TransactionTypeParams extends Equatable {
  final TransactionType type;
  final DateTime startDate;
  final DateTime endDate;

  const TransactionTypeParams(this.type,this.startDate,this.endDate);

  @override
  List<Object> get props => [type.index,startDate,endDate];
}
