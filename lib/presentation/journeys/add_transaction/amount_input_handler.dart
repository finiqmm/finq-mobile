class AmountInputHandler {
  AmountInputHandler._();

  static String onDotPressed([String initialAmount = "0"]) {
    if (initialAmount.contains('.')) {
      return initialAmount;
    }
    return initialAmount + '.';
  }

  static String onNumberPressed(String enterAmount,
      [String initialAmount = "0"]) {
    if (initialAmount == "0") {
      return enterAmount;
    }
    return initialAmount + enterAmount;
  }
}

// - if input is 1,2,3 ***
//    if text is 0 && input is for first index
//      text.sum(input)
//    else
//      text + input

//  - if input is '.' ***
//    if text is 0 && input is for first index
//      text + input
//    else if '.' char alredy present in text
//      return
//    else
//     text + input
