import 'package:finq/common/constants/size_constants.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/common_widget/rounded_profile_icon.dart';
import 'package:finq/presentation/journeys/home/delegates/home_transaction_list_delegate.dart';
import 'package:finq/presentation/journeys/home/widgets/chart_data_item.dart';
import 'package:finq/presentation/models/transaction_ui_list_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finq/common/extension/size_extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'pie_chart_sections.dart';

class HomeChartWidget extends StatefulWidget {
  final void Function(String)? onDropdownChange;
  final DateTimeRange currentDateRange;
  final HomeTransactionListDelegate transactionListDelegate;

  const HomeChartWidget(
      {Key? key,
      this.onDropdownChange,
      required this.currentDateRange,
      required this.transactionListDelegate})
      : super(key: key);
  @override
  _HomeChartWidgetState createState() =>
      _HomeChartWidgetState(transactionListDelegate);
}

class _HomeChartWidgetState extends State<HomeChartWidget> {
  int? touchedSectionIndex;
  String? selectedFilter;
  List<String> filters = ["Daily", "Weekly", "Monthly"];
  int touchedIndex = -1;

  _HomeChartWidgetState(HomeTransactionListDelegate transactionListDelegate) {
    transactionListDelegate.onHomeScreenFilterChange = onHomeScreenFilterChange;
  }

  void onHomeScreenFilterChange() {
    debugPrint("Dispatch" + selectedFilter.toString());
    if (selectedFilter == null) return;
    transactionQueryBloc.watchHomeTransactionList(LoadHomeTransactionList(
        dateTimeRange: widget.currentDateRange,
        listFilter: getFilterEnum(selectedFilter!)));
    totalAmountCubit.watchTotalAmount(
        LoadTotalAmount(dateTimeRange: widget.currentDateRange));
  }

  TransactionQueryCubit get transactionQueryBloc =>
      context.read<TransactionQueryCubit>();
  TotalAmountCubit get totalAmountCubit => context.read<TotalAmountCubit>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Stack(
        children: [
          BlocBuilder<HomeChartDataBloc, HomeChartDataState>(
            builder: (context, state) {
              if (state is HomeChartDataLoaded) {
                return Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(top: Sizes.dimen_24),
                      child: PieChart(
                        PieChartData(
                            pieTouchData: PieTouchData(
                              touchCallback: (event, pieTouchResponse) {
                                setState(() {
                                  if (!event.isInterestedForInteractions ||
                                      pieTouchResponse == null ||
                                      pieTouchResponse.touchedSection == null) {
                                    touchedSectionIndex = -1;
                                    return;
                                  }
                                  touchedIndex = pieTouchResponse
                                      .touchedSection!.touchedSectionIndex;
                                });
                              },
                            ),
                            sectionsSpace: 3,
                            centerSpaceRadius: 50,
                            sections: getSections(
                                touchedSectionIndex, state.chartItems),
                            borderData: FlBorderData(show: false)),
                        swapAnimationCurve: Curves.linear,
                        swapAnimationDuration: Duration(milliseconds: 150),
                      ),
                    )),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: ListWheelScrollView(
                                useMagnifier: true,
                                itemExtent: 38,
                                children: state.chartItems
                                    .map((e) => ChartDataItem(data: e))
                                    .toList()),
                          ),
                          SizedBox(
                            height: 24,
                          )
                        ],
                      ),
                    )
                  ],
                  // ),
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
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary, width: 2),
                ),
                child: DropdownButton(
                    value: selectedFilter,
                    items: filters.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: new Text(
                          value,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      );
                    }).toList(),
                    isDense: true,
                    hint: Text("Daily",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).colorScheme.secondary)),
                    onChanged: (value) {
                      if (value == null) return;
                      if (value == selectedFilter) return;
                      selectedFilter = value.toString();

                      widget.onDropdownChange!(selectedFilter.toString());
                    },
                    underline: Container(
                      height: 0,
                    ))),
          )
        ],
      ),
    );
  }
}
