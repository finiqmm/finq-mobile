import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SettingsList(
        contentPadding: EdgeInsets.zero,
        sections: [
          SettingsSection(
            title: "Language",
            tiles: [
              SettingsTile(
                  title: "Language",
                  subtitle: "English",
                  leading: Icon(Icons.language),
                  onPressed: (BuildContext ctx) {})
            ],
          )
        ],
      ),
    );
  }
}
