import 'package:finq/common/extension/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArticleInfoRow extends StatelessWidget {
  final String publisherName;
  final Color itemColor;
  final int createdDate;

  const ArticleInfoRow(
      {Key? key,
      required this.publisherName,
      required this.itemColor,
      required this.createdDate})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          FontAwesomeIcons.userAlt,
          color: itemColor,
          size: 12,
        ),
        SizedBox(
          width: 8.0,
        ),
        Text(
          publisherName,
          style:
              Theme.of(context).textTheme.caption?.copyWith(color: itemColor),
        ),
        SizedBox(
          width: 16.0,
        ),
        Icon(
          FontAwesomeIcons.clock,
          color: Colors.black,
          size: 12,
        ),
        SizedBox(
          width: 8.0,
        ),
        Text(
          DateFormatter.convertMillisecondToString(milliSecond: createdDate),
          style:
              Theme.of(context).textTheme.caption?.copyWith(color: itemColor),
        ),
      ],
    );
  }
}
