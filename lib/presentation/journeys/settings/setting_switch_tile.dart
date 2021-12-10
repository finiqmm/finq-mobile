import 'package:flutter/material.dart';

class SettingSwitchTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isOn;
  final ValueChanged<bool> onChanged;

  const SettingSwitchTile({
    Key? key,
    required this.title,
    required this.isOn,
    required this.onChanged,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      contentPadding: EdgeInsets.all(0),
      value: isOn,
      onChanged: onChanged,
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              overflow: TextOverflow.ellipsis,
            )
          : null,
    );
  }
}
