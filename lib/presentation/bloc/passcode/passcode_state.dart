part of 'passcode_cubit.dart';

abstract class PasscodeState extends Equatable {
  const PasscodeState();

  @override
  List<Object> get props => [];
}

class PasscodeInitial extends PasscodeState {}

class PasscodeFailed extends PasscodeState {
  final String reason;
  PasscodeFailed({required this.reason});

  @override
  List<Object> get props => [reason];
}

class PasscodeSuccess extends PasscodeState {
  final bool isNavigateToHomeScreen;
  PasscodeSuccess({required this.isNavigateToHomeScreen});

  @override
  List<Object> get props => [isNavigateToHomeScreen];
}

class IsPasscodeExist extends PasscodeState {
  final bool isExist;

  IsPasscodeExist({required this.isExist});
}
