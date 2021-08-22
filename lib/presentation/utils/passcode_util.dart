typedef Null BlockTextChangedCallback(String blockText, int blockPosition);
typedef Null PasscodeChangedCallback(String passcode);

class PasscodeValidation {
  
  String prevousCode = "";
  int passcodeEnterCount = 0;
  
  void okTest(String enterPin) {

  }

  void setFirstTime(String enterPin) {
    this.prevousCode = enterPin;
    passcodeEnterCount++;
  }
}
