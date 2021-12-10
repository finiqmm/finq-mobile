import 'package:flutter/material.dart';

class SettingsSection extends StatelessWidget {
  final String sectionTitle;
  final EdgeInsetsGeometry? titlePadding;
  final List<Widget> sectionTitles;

  const SettingsSection({
    Key? key,
    required this.sectionTitle,
    required this.sectionTitles,
    this.titlePadding = const EdgeInsets.only(top:12.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: titlePadding!,
          child: buildSectionTitle(sectionTitle, context),
        ),
        ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: sectionTitles,
        ),
        Divider(
          height: 1,
        ),
      ],
    );
  }

  Widget buildSectionTitle(String title, BuildContext context) {
    return Text(title,
        style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold));
  }
}
