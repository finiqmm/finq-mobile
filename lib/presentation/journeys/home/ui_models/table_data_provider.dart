class TableData {
  final String dateString;
  final String totalIncome;
  final String totalExpense;
  final List<DataItem> dataItems;

  TableData(
      this.dateString, this.totalIncome, this.totalExpense, this.dataItems);

  static List<TableData> getTableDatas() {
    return [
      TableData('June 2 2021', '12345', '20000', DataItem.getDataItems()),
      TableData('June 2 2021', '12345', '20000', DataItem.getDataItems()),
      TableData('June 2 2021', '12345', '20000', DataItem.getDataItems()),
      TableData('June 2 2021', '12345', '20000', DataItem.getDataItems()),
      TableData('June 2 2021', '12345', '20000', DataItem.getDataItems()),
      TableData('June 2 2021', '12345', '20000', DataItem.getDataItems())
    ];
  }
}
//0 for income
//1 for expense
class DataItem {
  final String categoryName;
  final String desc;
  final String amount;
  final int transactionType;

  DataItem(this.categoryName, this.desc, this.amount, this.transactionType);

  static List<DataItem> getDataItems() {
    return [
      DataItem('Awards', 'first prize', '50000', 0),
      DataItem('Beauty', 'first prize', '50000', 1),
      DataItem('Shopping', 'first prize', '50000', 1),
      DataItem('Others', 'first prize', '50000', 0),
      DataItem('Salary', 'first prize', '50000', 0),
      DataItem('Grocery', 'first prize', '50000', 1),
      DataItem('Social', 'first prize', '50000', 1),
      DataItem('Lottery', 'first prize', '50000', 0)
    ];
  }
}