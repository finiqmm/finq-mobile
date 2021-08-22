import 'package:finq/common/constants/languages.dart';
import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/common/constants/size_constants.dart';
import 'package:finq/common/constants/translation_constants.dart';
import 'package:finq/presentation/bloc/app/app_bloc.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/journeys/profile/language_chooser_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:finq/common/extension/size_extension.dart';
import 'package:finq/common/extension/string_extension.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_16.w, vertical: Sizes.dimen_16.h),
      child: ListView(
        children: [
        
          BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              if (state is LanguageLoaded) {
                final countryCode = state.locale.languageCode;

                return ListTile(
                  onTap: () {
                    _showModalBottomSheet(context);
                  },
                  leading: Icon(FontAwesomeIcons.language),
                  title: Text(TranslationConstants.titleLanguage.t(context)),
                  trailing: Icon(countryCode == "en"
                      ? FontAwesomeIcons.flagUsa
                      : FontAwesomeIcons.flag),
                );
              }
              return SizedBox.shrink();
            },
          ),
          BlocBuilder<ThemeCubit,Themes>(
            builder: (context, theme) {
              return ListTile(
                onTap: () => context.read<ThemeCubit>().toggleTheme(),
                leading: Icon(FontAwesomeIcons.adjust),
                title: Text(TranslationConstants.titleThemes.t(context)),
                trailing: Icon(FontAwesomeIcons.chevronRight),
              );
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.lock),
            title: Text(TranslationConstants.titlePasscode.t(context)),
            trailing: Icon(FontAwesomeIcons.chevronRight),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.infoCircle),
            title: Text(TranslationConstants.titleAbout.t(context)),
            trailing: Icon(FontAwesomeIcons.chevronRight),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidQuestionCircle),
            title: Text(TranslationConstants.titleHelp.t(context)),
            trailing: Icon(FontAwesomeIcons.chevronRight),
          ),
          BlocListener<AppBloc, AppState>(
            listenWhen: (previous, current) => current is UnAuthenticated,
            listener: (context, state) {
              if (state is UnAuthenticated) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(RouteList.login, (route) => false);
              }
            },
            child: ListTile(
              onTap: () =>
                  context.read<AppBloc>().add(SignOutPressedEvent()),
              leading: Icon(FontAwesomeIcons.signOutAlt),
              title: Text(TranslationConstants.titleLogout.t(context)),
              trailing: Icon(FontAwesomeIcons.chevronRight),
            ),
          ),
        ],
      ),
    );
  }

  _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LanguageChooserDialog(onPressed: (index) {
            Navigator.pop(context);
            BlocProvider.of<LanguageBloc>(context)
                .add(ToggleLanguageEvent(Languages.languages[index]));
          });
        });
  }
}
