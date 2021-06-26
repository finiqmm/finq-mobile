import 'package:finq/data/core/loan_calculator_util.dart';
import 'package:finq/domain/entities/calculated_loan_entity.dart';

abstract class LoanCalculatorDataSource {
  CalculatedLoanEntity getCalculatedLoan(double p, double i, double months);
}

class LoanCalculatorDataSourceImpl extends LoanCalculatorDataSource {
  LoanCalculatorDataSourceImpl();

  @override
  CalculatedLoanEntity getCalculatedLoan(double p, double i, double y) {
    double principal = LoanCalculatorUtil.calPric(p);

    double rate = LoanCalculatorUtil.calInt(i);

    double months = LoanCalculatorUtil.calMonth(y);

    double dvdnt = LoanCalculatorUtil.calDvdnt(rate, months);

    double fd = LoanCalculatorUtil.calFinalDvdnt(principal, rate, dvdnt);

    double d = LoanCalculatorUtil.calDivider(dvdnt);

    double emi = LoanCalculatorUtil.calEmi(fd, d);

    double ta = LoanCalculatorUtil.calTa(emi, months);

    double ti = LoanCalculatorUtil.calTotalInt(ta, principal);

    return CalculatedLoanEntity(emi: emi, interestTotal: ti);
  }
}
