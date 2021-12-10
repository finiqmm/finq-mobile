import 'package:app_settings/app_settings.dart';
import 'package:finq/common/constants/languages.dart';
import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/journeys/passcode/passcode_option.dart';
import 'package:finq/presentation/journeys/settings/language_chooser_dialog.dart';
import 'package:finq/presentation/journeys/settings/setting_switch_tile.dart';
import 'package:finq/presentation/journeys/settings/setting_tiles.dart';
import 'package:finq/presentation/journeys/settings/settings_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          SettingsSection(
            sectionTitles: [
              BlocBuilder<LanguageBloc, LanguageState>(
                builder: (context, state) {
                  if (state is LanguageLoaded) {
                    final countryCode = state.locale.languageCode;
                    return SettingTiles(
                      title: "Language",
                      subtitle: Languages.getLanguageName(countryCode),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (ctx) => LanguageChooserDialog(
                                  onChange: (val) {
                                    context.read<LanguageBloc>()
                                        .add(ToggleLanguageEvent(val));
                                  },
                                  langCode: countryCode,
                                ));
                      },
                    );
                  }
                  return SizedBox.shrink();
                },
              )
            ],
            sectionTitle: 'Language',
          ),
          SettingsSection(
            sectionTitles: [
              BlocBuilder<PincodeCubit, PincodeState>(
                builder: (context, state) {
                  if (state is IsPasscodeExist) {
                    return SettingSwitchTile(
                      title: "Use Passcode",
                      isOn: state.isExist,
                      onChanged: (val) {
                        Navigator.pushNamed(context, RouteList.passcode,
                            arguments: val == true
                                ? PasscodeEntryOption.passcodeNew
                                : PasscodeEntryOption.passcodeRemove);
                      },
                    );
                  }
                  return SizedBox.shrink();
                },
              )
            ],
            sectionTitle: 'Security',
          ),
          SettingsSection(
            sectionTitles: [
              BlocBuilder<ThemeCubit, Themes>(
                builder: (context, state) => SettingSwitchTile(
                  title: "Dark Mode",
                  isOn: state == Themes.dark ? true : false,
                  onChanged: (val) => context.read<ThemeCubit>().toggleTheme(),
                ),
              )
            ],
            sectionTitle: 'Theme',
          ),
          SettingsSection(
            sectionTitles: [
              SettingSwitchTile(
                title: "Remind everyday",
                subtitle: "Remind to add transaction daily",
                isOn: true,
                onChanged: (val) {},
              ),
              SettingTiles(
                title: "Notification Settings",
                onTap: () {
                  AppSettings.openNotificationSettings();
                },
              )
            ],
            sectionTitle: 'Notification',
          ),
          SettingsSection(
            sectionTitles: [
              BlocListener<AppBloc, AppState>(
                  listenWhen: (previous, current) => current is UnAuthenticated,
                  listener: (context, state) {
                    if (state is UnAuthenticated) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          RouteList.login, (route) => false);
                    }
                  },
                  child: SettingTiles(
                    title: "Log out",
                    onTap: () =>
                        context.read<AppBloc>().add(SignOutPressedEvent()),
                  )),
            ],
            sectionTitle: 'Account',
          ),
          SettingsSection(
            sectionTitles: [
              SettingTiles(
                title: "Privacy policy",
                onTap: () {},
              ),
              SettingTiles(
                title: "Get Help",
                onTap: () {},
              ),
              SettingTiles(
                title: "About Us",
                onTap: () {},
              )
            ],
            sectionTitle: 'About',
          ),
        ],
      ),
    );
  }
}
