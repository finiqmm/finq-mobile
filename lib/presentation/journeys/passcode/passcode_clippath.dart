import 'dart:ffi';

import 'package:flutter/material.dart';

class TopWaveClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;

  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, 40.0);

    double aCX = (size.width / 4) / 2;
    double bCY = 60.0;
    var firstController = Offset(aCX, bCY);

    double aEX = size.width / 4;
    double bEY = 40;
    var firstEndPoint = Offset(aEX, bEY);

    path.quadraticBezierTo(firstController.dx, firstController.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    double cCX = size.width * 0.5;
    double dCY = 0.0;
    var secondController = Offset(cCX, dCY);

    double cEX = size.width * 0.75;
    double dEY = 40;
    var secondEndPoint = Offset(cEX, dEY);

    path.quadraticBezierTo(secondController.dx, secondController.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    double eCX = size.width * 0.875;
    double fCY = 60;
    var thirdController = Offset(eCX, fCY);

    double eEX = size.width;
    double fEY = 40;
    var thirdEndPoint = Offset(eEX, fEY);

    path.quadraticBezierTo(thirdController.dx, thirdController.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    return path;
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;

  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, 40);

    double aCX = (size.width / 4) / 2;
    double bCY = 0.0;
    var firstController = Offset(aCX, bCY);

    double aEX = size.width / 4;
    double bEY = 40;
    var firstEndPoint = Offset(aEX, bEY);

    path.quadraticBezierTo(firstController.dx, firstController.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    double cCX = size.width / 2;
    double dCY =60;
    var secondController = Offset(cCX, dCY);

    double cEX = size.width * 0.75;
    double dEY = 40;
    var secondEndPoint = Offset(cEX, dEY);

    path.quadraticBezierTo(secondController.dx, secondController.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    double eCX = size.width * 0.875;
    double fCY = 0.0;
    var thirdController = Offset(eCX, fCY);

    double eEX = size.width;
    double fEY = 40;
    var thirdEndPoint = Offset(eEX, fEY);

    path.quadraticBezierTo(thirdController.dx, thirdController.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    return path;
  }
}
