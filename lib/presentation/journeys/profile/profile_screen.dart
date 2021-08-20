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
  late final PasscodeCubit _passcodeCubit;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileBloc>(context).add(LoadProfileEvent());
    _languageBloc = BlocProvider.of<LanguageBloc>(context);
    _passcodeCubit = BlocProvider.of<PasscodeCubit>(context);
    _languageBloc.add(LoadPreferredLanguageEvent());
    _passcodeCubit.isAppLocked();
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
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: _languageBloc),
                BlocProvider.value(value: _passcodeCubit)
              ],
              child: ProfileSettings(),
            ),
            // child: BlocProvider.value(
            //   value: _languageBloc,
            //   child: ProfileSettings(),
            // ),
          ),
        ],
      ),
    );
  }
}
