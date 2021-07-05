import 'package:finq/common/constants/size_constants.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/journeys/home/widgets/chart_data_item.dart';
import 'package:finq/presentation/widgets/rounded_profile_icon.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finq/common/extension/size_extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'pie_chart_sections.dart';

class HomeChartWidget extends StatefulWidget {
  @override
  _HomeChartWidgetState createState() => _HomeChartWidgetState();
}

class _HomeChartWidgetState extends State<HomeChartWidget> {
  int? touchedSectionIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      color: Colors.white,
      child: Stack(
        children: [
          BlocBuilder<HomeChartDataBloc, HomeChartDataState>(
            // buildWhen: (previus, current) =>
            //     current is HomeChartDataLoaded,
            builder: (context, state) {
              if (state is HomeChartDataLoaded) {
                return Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(top: Sizes.dimen_24),
                      child: PieChart(
                        PieChartData(
                          pieTouchData:
                              PieTouchData(touchCallback: (pieTouchResponse) {
                            setState(() {
                              final desiredTouch = pieTouchResponse.touchInput
                                      is! PointerExitEvent &&
                                  pieTouchResponse.touchInput
                                      is! PointerUpEvent;
                              if (desiredTouch &&
                                  pieTouchResponse.touchedSection != null) {
                                touchedSectionIndex = pieTouchResponse
                                    .touchedSection!.touchedSectionIndex;
                              } else {
                                touchedSectionIndex = -1;
                              }
                            });
                          }),
                          sectionsSpace: 3,
                          centerSpaceRadius: 50,
                          sections: getSections(
                              touchedSectionIndex, state.chartItems),
                          borderData: FlBorderData(
                            show: false,
                          ),
                        ),
                        swapAnimationCurve: Curves.linear,
                        swapAnimationDuration: Duration(milliseconds: 150),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      foregroundDecoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.bottomCenter,
                              stops: [
                            0.3,
                            1
                          ],
                              colors: [
                            Colors.white.withOpacity(0.1),
                            Colors.white
                          ])),
                      child: ListWheelScrollView(
                          useMagnifier: true,
                          itemExtent: 38,
                          children: state.chartItems
                              .map((e) => ChartDataItem(data: e))
                              .toList()),
                    ))
                  ],
                );
              } else if (state is HomeChartDataLoading) {
                return Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator());
              }

              return SizedBox.shrink();
            },
          ),
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoaded) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: RoundedProfileIcon(
                          imageUrl: state.user!.avatarUrl!,
                          height: Sizes.dimen_24.h,
                          width: Sizes.dimen_48.w,
                        ),
                      )),
                );
              }
              return SizedBox.shrink();
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(right: 16, bottom: 8),
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).accentColor, width: 2),
              ),
              child: DropdownButton<String>(
                items:
                    <String>['Yearly', 'Daily', 'Monthly'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: new Text(
                      value,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  );
                }).toList(),
                isDense: true,
                hint:
                    Text("Monthly", style: Theme.of(context).textTheme.caption),
                onChanged: (_) {},
                underline: Container(
                  height: 0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
