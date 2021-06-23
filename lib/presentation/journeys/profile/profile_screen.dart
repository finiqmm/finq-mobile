import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/bloc/profile/profile_bloc.dart';
import 'package:finq/presentation/journeys/profile/profile_backdrop_widget.dart';
import 'package:finq/presentation/journeys/profile/profile_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final LanguageBloc _languageBloc;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileBloc>(context).add(LoadProfileEvent());
    _languageBloc = BlocProvider.of<LanguageBloc>(context);
    _languageBloc.add(LoadPreferredLanguageEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 0.35,
              child: ProfileBackdropWidget()),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.65,
            child: BlocProvider.value(
              value: _languageBloc,
              child: ProfileSettings(),
            ),
          ),
        ],
      ),
    );
  }
}
