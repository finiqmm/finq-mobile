import 'package:equatable/equatable.dart';

class LoanParams extends Equatable {
  final double p;
  final double i;
  final double y;

  LoanParams(this.p, this.i, this.y);

  @override
  List<Object?> get props => [p, i, y];
}
