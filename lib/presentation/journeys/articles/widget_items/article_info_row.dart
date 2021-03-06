import 'package:finq/common/extension/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArticleInfoRow extends StatelessWidget {
  final String publisherName;
  final int createdDate;

  const ArticleInfoRow(
      {Key? key,
      required this.publisherName,
      required this.createdDate})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          FontAwesomeIcons.userAlt,
          size: 12,
        ),
        SizedBox(
          width: 8.0,
        ),
        Text(
          publisherName,
          style:
              Theme.of(context).textTheme.caption,
        ),
        SizedBox(
          width: 16.0,
        ),
        Icon(
          FontAwesomeIcons.clock,
          size: 12,
        ),
        SizedBox(
          width: 8.0,
        ),
        Text(
          createdDate.millisecondToString(),
          style:
              Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}
