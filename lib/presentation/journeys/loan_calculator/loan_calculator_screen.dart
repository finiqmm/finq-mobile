import 'package:finq/common/loancalculatorutil/loan_calculator_util.dart';
import 'package:finq/presentation/bloc/calculated_loan/calculated_loan_bloc.dart';
import 'package:finq/presentation/widgets/finq_button.dart';
import 'package:finq/presentation/widgets/finq_gradient_bg_box_decoration.dart';
import 'package:finq/presentation/widgets/finq_text.dart';
import 'package:finq/presentation/widgets/finq_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoanCalculatorScreen extends StatefulWidget {
  @override
  _LoanCalculatorScreenState createState() => _LoanCalculatorScreenState();
}

class _LoanCalculatorScreenState extends State<LoanCalculatorScreen> {
  final principalTextController = TextEditingController();
  final interestTextController = TextEditingController();
  final monthsTextController = TextEditingController();

  var emi_total = 0;
  var interest_total = 0;

  late final CalculatedLoanBloc calculatedLoanBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<CalculatedLoanBloc>(
        create: (context) => calculatedLoanBloc,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              BlocConsumer<CalculatedLoanBloc, CalculatedLoanState>(
                listenWhen: (previous, current) =>
                    current is CalculatedLoanSuccess,
                listener: (context, state) {
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            height: 100,
                            padding: EdgeInsets.all(8.0),
                            decoration:
                                FinQGradiantBgBoxDecoration().createElement(),
                            child: Column(
                              children: [
                                FinQText(
                                  title: "Monthly Repayment",
                                  fontWeight: FontWeight.bold,
                                  size: 12.0,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 32.0,
                                ),
                                FinQText(
                                  title: emi_total.toString(),
                                  fontWeight: FontWeight.bold,
                                  size: 16.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        width: 16.0,
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            height: 100,
                            padding: EdgeInsets.all(8.0),
                            decoration:
                                FinQGradiantBgBoxDecoration().createElement(),
                            child: Column(
                              children: [
                                FinQText(
                                  title: "Monthly Repayment",
                                  fontWeight: FontWeight.bold,
                                  size: 12.0,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 32.0,
                                ),
                                FinQText(
                                  title: interest_total.toString(),
                                  fontWeight: FontWeight.bold,
                                  size: 16.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )),
                    ],
                  );
                },
                builder: (context, state) {
                  if (state is CalculatedLoanError) {
                    return Text('Something went wrong');
                  }
                  return SizedBox.shrink();
                },
              ),
              SizedBox(height: 32.0),
              FinQTextField(
                  controller: principalTextController,
                  label: "Loan Amount (Kyats)"),
              SizedBox(height: 8.0),
              FinQTextField(
                  controller: interestTextController,
                  label: "Monthly Interest Reate (%)"),
              SizedBox(height: 8.0),
              FinQTextField(
                  controller: monthsTextController,
                  label: "Loan Term (Months)"),
              SizedBox(height: 16.0),
              FinqButton(
                onPressed: () {
                  calculatedLoanBloc.add(CalculatePressed());
                },
                text: 'Calculate',
              )
            ],
          ),
        ),
      ),
    );
  }

  calculate(double p, double i, double y) {
    double principal = LoanCalculatorUtil.calPric(p);

    double rate = LoanCalculatorUtil.calInt(i);

    double months = LoanCalculatorUtil.calMonth(y);

    double dvdnt = LoanCalculatorUtil.calDvdnt(rate, months);

    double fd = LoanCalculatorUtil.calFinalDvdnt(principal, rate, dvdnt);

    double d = LoanCalculatorUtil.calDivider(dvdnt);

    double emi = LoanCalculatorUtil.calEmi(fd, d);

    double ta = LoanCalculatorUtil.calTa(emi, months);

    double ti = LoanCalculatorUtil.calTotalInt(ta, principal);

    return {emi, ti};
  }
}
