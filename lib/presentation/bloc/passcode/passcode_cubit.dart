import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/entities/passcode_params.dart';
import 'package:finq/domain/usecases/auth/check_passcode_match.dart';
import 'package:finq/domain/usecases/auth/get_passcode.dart';
import 'package:finq/domain/usecases/auth/save_passcode.dart';
import 'package:finq/domain/usecases/use_case_imports.dart';
import 'package:finq/presentation/bloc/blocs.dart';

part 'passcode_state.dart';

class PasscodeCubit extends Cubit<PasscodeState> {
  final SavePasscode _savePasscode;
  final CheckPasscodeMatch _checkPasscodeMatch;
  final GetPasscode _getPasscode;
  final RemovePasscode _removePasscode;

  PasscodeCubit(this._savePasscode, this._checkPasscodeMatch, this._getPasscode,
      this._removePasscode)
      : super(PasscodeInitial());

  void save(String value) async {
    final result = await _savePasscode(PasscodeParams(passcodeValue: value));
    emit(result.fold((l) => PasscodeFailed(reason: l.message), (r) {
      isAppLocked();
      return PasscodeSuccess(isNavigateToHomeScreen: false);
    }));
  }

  void isAppLocked() async {
    final result = await _getPasscode(NoParams());
    emit(result.fold((l) => PasscodeFailed(reason: l.message),
        (r) => IsPasscodeExist(isExist: r != null)));
  }

  void isPasscodeMatch(String value) async {
    final result =
        await _checkPasscodeMatch(PasscodeParams(passcodeValue: value));
    emit(result.fold((l) => PasscodeFailed(reason: l.message), (r) {
      return PasscodeSuccess(isNavigateToHomeScreen: true);
    }));
  }

  void remove(String value) async {
    final result = await _removePasscode(PasscodeParams(passcodeValue: value));
    emit(result.fold((l) {
      isAppLocked();
      return PasscodeFailed(reason: l.message);
    }, (r) {
      isAppLocked();
      return PasscodeSuccess(isNavigateToHomeScreen: false);
    }));
  }
}
