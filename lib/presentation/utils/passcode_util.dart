import 'dart:async';

typedef Null BlockTextChangedCallback(String blockText, int blockPosition);
typedef Null PasscodeChangedCallback(String passcode);
// enum PasscodeEntryStatus { idle, progress, success, failed }

// class PasscodeValidation {
//   String previousCode = "";
//   int passcodeEnterCount = 1;
//   Map<int, String> pinCodeMap = Map<int, String>();

//   var _controller = StreamController<PasscodeEntryStatus>();

//   Stream<PasscodeEntryStatus> get statusStream => _controller.stream;

//   void addPinEntry(String code) async {
//     var lastStatus = await statusStream.last;
//     if (lastStatus == PasscodeEntryStatus.idle) {
//       previousCode = code;
//       // pinCodeMap[1] = code;
//       _controller.sink.add(PasscodeEntryStatus.progress);
//     } else if (lastStatus == PasscodeEntryStatus.progress) {
//       if (code == previousCode) {
//         _controller.sink.add(PasscodeEntryStatus.success);
//       } else {
//         _controller.sink.add(PasscodeEntryStatus.failed);
//       }

//       previousCode = "";
//     }
//   }

//   void clear() {
//     _controller.close();
//   }

//   // bool okTest(String enterPin) {
//   //   if (enterPin == prevousCode) {
//   //     return true;
//   //   }
//   //   return false;
//   // }

//   // void setFirstTime(String enterPin) {
//   //   this.prevousCode = enterPin;
//   //   passcodeEnterCount++;
//   // }

//   // bool isFinal() {
//   //   return passcodeEnterCount == 2;
//   // }
// }
