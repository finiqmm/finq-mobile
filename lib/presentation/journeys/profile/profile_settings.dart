import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/presentation/bloc/app/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.all(16),
      child: ListView(
        children: [
          ListTile(
            leading: Icon(FontAwesomeIcons.language),
            title: Text('Languages'),
            trailing: Icon(FontAwesomeIcons.chevronRight),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.adjust),
            title: Text('Themes'),
            trailing: Icon(FontAwesomeIcons.chevronRight),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.lock),
            title: Text('Use Passcode'),
            trailing: Icon(FontAwesomeIcons.chevronRight),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.infoCircle),
            title: Text('About'),
            trailing: Icon(FontAwesomeIcons.chevronRight),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidQuestionCircle),
            title: Text('Get Help'),
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
                  BlocProvider.of<AppBloc>(context).add(SignOutPressedEvent()),
              leading: Icon(FontAwesomeIcons.signOutAlt),
              title: Text('Logout'),
              trailing: Icon(FontAwesomeIcons.chevronRight),
            ),
          ),
        ],
      ),
    );
  }
}
