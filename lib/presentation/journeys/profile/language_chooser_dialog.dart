import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:finq/common/extension/size_extension.dart';

class LanguageChooserDialog extends StatelessWidget {
  final Function(int) onPressed;

  LanguageChooserDialog({required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getFullHeight() / 5,
      child: Column(
        children: [
          ListTile(
            onTap: () => onPressed(0),
            title: Text('English'),
            leading: Icon(FontAwesomeIcons.flagUsa),
          ),
          ListTile(
            onTap: () => onPressed(1),
            title: Text('Myanmar'),
            leading: Icon(FontAwesomeIcons.flag),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }
}
