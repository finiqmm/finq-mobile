import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/bloc/profile/profile_bloc.dart';
import 'package:finq/presentation/journeys/settings/settings_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final LanguageBloc _languageBloc;
  late final PincodeCubit _passcodeCubit;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileBloc>(context).add(LoadProfileEvent());
    _languageBloc = BlocProvider.of<LanguageBloc>(context);
    _passcodeCubit = BlocProvider.of<PincodeCubit>(context);
    _languageBloc.add(LoadPreferredLanguageEvent());
    _passcodeCubit.isAppLocked();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _languageBloc),
        BlocProvider.value(value: _passcodeCubit)
      ],
      child: SettingsList(),
    );
  }
}
