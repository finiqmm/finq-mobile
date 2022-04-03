import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'pincode_validation_state.dart';

@injectable
class PincodeValidationCubit extends Cubit<PincodeValidationState> {
  PincodeValidationCubit() : super(PincodeValidationIdle());
  String previousCode = "";

  void addPinEntry(String code) async {
    if (state is PincodeValidationIdle || state is PincodeValidationFailed) {
      previousCode = code;
      emit(PinValidationProgress());
      // pinCodeMap[1] = code;
      // _controller.sink.add(PasscodeEntryStatus.progress);
    } else if ( state is PinValidationProgress) {
      if (code == previousCode) {
        previousCode = "";

        emit(PincodeValidationSuccess(pinCode: code));

        // _controller.sink.add(PasscodeEntryStatus.success);
      } else {
        previousCode = "";

        emit(PincodeValidationFailed(reason: 'not match pin'));

        // _controller.sink.add(PasscodeEntryStatus.failed);
      }
    }
  }
}
