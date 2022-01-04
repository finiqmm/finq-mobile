part of 'date_selection_cubit.dart';

class DateSelectionState extends Equatable {
  final DateTimeRange currentDateRange;
  final TransactionUiListFilter listFilter;

  DateSelectionState({required this.currentDateRange, required this.listFilter})
      : super();

  @override
  List<Object?> get props => [currentDateRange, listFilter];

  factory DateSelectionState.initalState() {
    return DateSelectionState(
        currentDateRange: FinQDateUtil.getCurrentMonthDateRange(),
        listFilter: TransactionUiListFilter.DAILY);
  }

  DateSelectionState copy(
      DateTimeRange? currentDateRange, TransactionUiListFilter? listFilter) {
    return DateSelectionState(
        currentDateRange: currentDateRange ?? this.currentDateRange,
        listFilter: listFilter ?? this.listFilter);
  }
}
