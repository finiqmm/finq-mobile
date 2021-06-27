import 'package:finq/common/constants/size_constants.dart';
import 'package:finq/common/screenutil/screenutil.dart';
import 'package:finq/common/extension/size_extension.dart';
import 'package:finq/di/get_it.dart';
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
  late final CalculatedLoanBloc calculatedLoanBloc;
  final principalTextController = TextEditingController();
  final interestTextController = TextEditingController();
  final monthsTextController = TextEditingController();

  var emi_total = 0;
  var interest_total = 0;

  @override
  void initState() {
    super.initState();
    calculatedLoanBloc = getItInstance<CalculatedLoanBloc>();
  }

  @override
  void dispose() {
    principalTextController.dispose();
    interestTextController.dispose();
    monthsTextController.dispose();
    super.dispose();
    calculatedLoanBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider.value(
        value: calculatedLoanBloc,
        child: Padding(
          padding: EdgeInsets.only(
              top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
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
                              BlocBuilder<CalculatedLoanBloc,
                                  CalculatedLoanState>(
                                builder: (context, state) => FinQText(
                                  title: (state is CalculatedLoanSuccess)
                                      ? state.calculatedLoanEntity.emi
                                          .toString()
                                      : "0",
                                  fontWeight: FontWeight.bold,
                                  size: 16.0,
                                  color: Colors.white,
                                ),
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
                              BlocBuilder<CalculatedLoanBloc,
                                  CalculatedLoanState>(
                                builder: (context, state) => FinQText(
                                  title: (state is CalculatedLoanSuccess)
                                      ? state.calculatedLoanEntity.interestTotal
                                          .toString()
                                      : "0",
                                  fontWeight: FontWeight.bold,
                                  size: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
                SizedBox(height: 32.0),
                FinQTextField(
                    keyboardType: TextInputType.number,
                    controller: principalTextController,
                    label: "Loan Amount (Kyats)"),
                SizedBox(height: 8.0),
                FinQTextField(
                    keyboardType: TextInputType.number,
                    controller: interestTextController,
                    label: "Monthly Interest Reate (%)"),
                SizedBox(height: 8.0),
                FinQTextField(
                    keyboardType: TextInputType.number,
                    controller: monthsTextController,
                    label: "Loan Term (Months)"),
                SizedBox(height: 16.0),
                FinqButton(
                  onPressed: () {
                    calculatedLoanBloc.add(CalculatePressed(
                        double.parse(principalTextController.text),
                        double.parse(interestTextController.text),
                        double.parse(monthsTextController.text)));
                  },
                  text: 'Calculate',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
