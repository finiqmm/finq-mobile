import 'package:flutter/material.dart';

class FinQGradiantBgBoxDecoration {
  FinQGradiantBgBoxDecoration();
  BoxDecoration createElement() {
    return new BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      gradient: new LinearGradient(
          colors: [
            const Color(0xFF3366FF),
            const Color(0xFF00CCFF),
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp),
    );
  }
}
