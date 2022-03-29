import 'package:finq/di/injectable.dart';
import 'package:finq/presentation/bloc/backup/cubit/restore_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/blocs.dart';

class MainProviderDependencies extends StatefulWidget {
  final Widget child;

  MainProviderDependencies({Key? key, required this.child}) : super(key: key);

  @override
  State<MainProviderDependencies> createState() =>
      _MainProviderDependenciesState();
}

class _MainProviderDependenciesState extends State<MainProviderDependencies> {
  late final AppBloc _appBloc;
  late final LanguageBloc _languageBloc;
  late final ThemeCubit _themeCubit;
  late final PincodeCubit _passcodeCubit;
  late final BackupCubit _backupCubit;
  late final FileExistCubit _checkBackupDbExist;
  late final RestoreCubit _restoreCubit;

  @override
  void initState() {
    super.initState();
    _appBloc = getItInstance<AppBloc>();
    _languageBloc = getItInstance<LanguageBloc>();
    _themeCubit = getItInstance<ThemeCubit>();
    _passcodeCubit = getItInstance<PincodeCubit>();
    _backupCubit = getItInstance<BackupCubit>();
    _checkBackupDbExist = getItInstance<FileExistCubit>();
    _restoreCubit = getItInstance<RestoreCubit>();

    _appBloc.add(IsUserFinishedOnboarding());
    _languageBloc.add(LoadPreferredLanguageEvent());
    _themeCubit.loadPreferredTheme();
  }

  @override
  void dispose() {
    _appBloc.close();
    _languageBloc.close();
    _themeCubit.close();
    _passcodeCubit.close();
    _backupCubit.close();
    _checkBackupDbExist.close();
    _restoreCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AppBloc>.value(
        value: _appBloc,
      ),
      BlocProvider<LanguageBloc>.value(
        value: _languageBloc,
      ),
      BlocProvider<ThemeCubit>.value(
        value: _themeCubit,
      ),
      BlocProvider<PincodeCubit>.value(
        value: _passcodeCubit,
      ),
      BlocProvider<BackupCubit>.value(
        value: _backupCubit,
      ),
      BlocProvider<RestoreCubit>.value(
        value: _restoreCubit,
      ),
      BlocProvider<FileExistCubit>.value(value: _checkBackupDbExist)
    ], child: widget.child);
  }
}
