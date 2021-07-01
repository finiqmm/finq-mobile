import 'package:finq/presentation/journeys/home/pie_data.dart';
import 'package:flutter/material.dart';

class ChartDataItem extends StatelessWidget {
  final Data data;
  const ChartDataItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0),  
      minLeadingWidth: 0,
      
      leading: Container(
        alignment: Alignment.center,
        width: 14,
        height: 14,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 4, color: data.color)),
      ),
      title: Text(
        '${data.name} ${data.percent.floor()}%',
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }
}
