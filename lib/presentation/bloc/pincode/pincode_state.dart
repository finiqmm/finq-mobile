part of 'pincode_cubit.dart';

abstract class PincodeState extends Equatable {
  const PincodeState();

  @override
  List<Object> get props => [];
}

class PincodeInitial extends PincodeState {}

class PincodeFailed extends PincodeState {
  final String reason;
  PincodeFailed({required this.reason});

  @override
  List<Object> get props => [reason];
}

class PincodeSuccess extends PincodeState {
  final bool isNavigateToHomeScreen;
  PincodeSuccess({required this.isNavigateToHomeScreen});

  @override
  List<Object> get props => [isNavigateToHomeScreen];
}

class IsPasscodeExist extends PincodeState {
  final bool isExist;

  IsPasscodeExist({required this.isExist});
}
