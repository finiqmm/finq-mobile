import 'dart:math';

class LoanCalculatorUtil {
  LoanCalculatorUtil._();

  static double calPric(double p) {
    return p;
  }

  static double calInt(double i) {
    return (i / 100.0).toDouble();
  }

  static double calMonth(double i) {
    return i;
  }

  static double calDvdnt(double rate, double months) {
    return pow((rate + 1).toDouble(), months.toDouble()).toDouble();
  }

  static double calFinalDvdnt(double principal, double rate, double dvdnt) {
    return principal * rate * dvdnt;
  }

  static double calDivider(double dvdnt) {
    return dvdnt - 1;
  }

  static double calEmi(double fd, double d) {
    return (fd ~/ d).toDouble();
  }

  static double calTa(double emi, double months) {
    return emi * months;
  }

  static double calTotalInt(double ta, double principal) {
    return ta - principal;
  }
}
