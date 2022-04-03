import 'package:finq/common/constants/languages.dart';
import 'package:finq/domain/entities/language_entity.dart';
import 'package:flutter/material.dart';

class LanguageChooserDialog extends StatelessWidget {
  final ValueChanged<LanguageEntity> onChange;
  final String langCode;
  const LanguageChooserDialog(
      {Key? key, required this.onChange, required this.langCode})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: Languages.languages
            .map((e) => RadioListTile(
                title: Text(e.value),
                value: e.code,
                groupValue: langCode,
                onChanged: (val) {
                  Navigator.pop(context);

                  onChange(e);
                }))
            .toList(),
      ),
    );
  }
}
