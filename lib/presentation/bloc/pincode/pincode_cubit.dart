import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/entities/passcode_params.dart';
import 'package:finq/domain/usecases/auth/check_passcode_match.dart';
import 'package:finq/domain/usecases/auth/get_passcode.dart';
import 'package:finq/domain/usecases/auth/save_passcode.dart';
import 'package:finq/domain/usecases/use_case_imports.dart';

part 'pincode_state.dart';

class PincodeCubit extends Cubit<PincodeState> {
  final SavePasscode _savePasscode;
  final CheckPasscodeMatch _checkPasscodeMatch;
  final GetPasscode _getPasscode;
  final RemovePasscode _removePasscode;

  PincodeCubit(this._savePasscode, this._checkPasscodeMatch, this._getPasscode,
      this._removePasscode)
      : super(PincodeInitial());

  void save(String value) async {
    final result = await _savePasscode(PasscodeParams(passcodeValue: value));
    emit(result.fold((l) => PincodeFailed(reason: l.message), (r) {
      isAppLocked();
      return PincodeSuccess(isNavigateToHomeScreen: false);
    }));
  }

  void isAppLocked() async {
    final result = await _getPasscode(NoParams());
    emit(result.fold((l) => PincodeFailed(reason: l.message),
        (r) => IsPasscodeExist(isExist: r != null)));
  }

  void isPasscodeMatch(String value) async {
    final result =
        await _checkPasscodeMatch(PasscodeParams(passcodeValue: value));
    emit(result.fold((l) => PincodeFailed(reason: l.message), (r) {
      if (r) {
        return PincodeSuccess(isNavigateToHomeScreen: true);
      }
      return PincodeFailed(reason: 'passcode not match');
    }));
  }

  void remove(String value) async {
    final result = await _removePasscode(PasscodeParams(passcodeValue: value));
    emit(result.fold((l) {
      isAppLocked();
      return PincodeFailed(reason: l.message);
    }, (r) {
      isAppLocked();
      return PincodeSuccess(isNavigateToHomeScreen: false);
    }));
  }
}
