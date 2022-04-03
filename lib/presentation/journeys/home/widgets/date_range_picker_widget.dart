import 'package:finq/common/constants/money_formatter.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:finq/common/extension/int_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateRangePickerWidget extends StatefulWidget {
  final Function(DateTimeRange)? selectedDateRange;

  DateRangePickerWidget({required this.selectedDateRange});

  @override
  _DateRangePickerWidgetState createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
 
  late DateTimeRange selectedDateTimeRange;
 
  TransactionQueryCubit get transactionQueryBloc =>
      context.read<TransactionQueryCubit>();

  TotalAmountCubit get totalAmoutBloc => context.read<TotalAmountCubit>();
  @override
  void initState() {
    super.initState();
    selectedDateTimeRange = FinQDateUtil.getCurrentMonthDateRange();
  }

  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(14.0),
      // color: Colors.grey[400],
      child: GestureDetector(
        onTap: () => pickDateRange(context),
        child: Material(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(FontAwesomeIcons.calendarWeek),
                Text(
                  selectedDateTimeRange.start.convertReadableDate(),
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text('-'),
                Text(selectedDateTimeRange.end.convertReadableDate(),
                    style: Theme.of(context).textTheme.subtitle2)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future pickDateRange(BuildContext context) async {
    final newDateRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        initialDateRange: selectedDateTimeRange,
        builder: (BuildContext context, Widget? child) {
          return child!;
        });

    if (newDateRange == null) return;

    setState(() => selectedDateTimeRange = newDateRange);
    widget.selectedDateRange!(selectedDateTimeRange);
    totalAmoutBloc.watchTotalAmount(
        LoadTotalAmount(dateTimeRange: selectedDateTimeRange));
    transactionQueryBloc.watchHomeTransactionList(
        LoadHomeTransactionList(dateTimeRange: selectedDateTimeRange));
  }
}
