import 'package:flutter/material.dart';

class SettingTiles extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  const SettingTiles({Key? key, required this.title,required this.onTap, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(title),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          : null,
      onTap: onTap,
    );
  }
}
