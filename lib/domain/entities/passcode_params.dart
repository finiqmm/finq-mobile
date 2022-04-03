import 'package:equatable/equatable.dart';

class PasscodeParams extends Equatable {
  final String passcodeValue;

  PasscodeParams({required this.passcodeValue});

  @override
  List<Object?> get props => [passcodeValue];
}
