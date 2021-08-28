part of 'pincode_validation_cubit.dart';

abstract class PincodeValidationState extends Equatable {
  const PincodeValidationState();

  @override
  List<Object> get props => [];
}

class PincodeValidationIdle extends PincodeValidationState {}

class PinValidationProgress extends PincodeValidationState {}

class PincodeValidationFailed extends PincodeValidationState {
  final String reason;
  PincodeValidationFailed({required this.reason});

  @override
  List<Object> get props => [reason];
}

class PincodeValidationSuccess extends PincodeValidationState {
  final String pinCode;
  PincodeValidationSuccess({required this.pinCode});

  @override
  List<Object> get props => [pinCode];
}
