import 'package:finq/presentation/bloc/backup/cubit/restore_cubit.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/journeys/settings/settings_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../common_widget/progress_loading_dialog.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final LanguageBloc _languageBloc;
  late final PincodeCubit _passcodeCubit;
  late final FileExistCubit _backFileExistCubit;
  late final RestoreCubit _restoreCubit;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileBloc>(context).add(LoadProfileEvent());
    _languageBloc = BlocProvider.of<LanguageBloc>(context);
    _passcodeCubit = BlocProvider.of<PincodeCubit>(context);
    _backFileExistCubit = BlocProvider.of<FileExistCubit>(context);
    _restoreCubit = BlocProvider.of<RestoreCubit>(context);
    _languageBloc.add(LoadPreferredLanguageEvent());
    _passcodeCubit.isAppLocked();
    _backFileExistCubit.isFileExist();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(listeners: [
      BlocListener<BackupCubit, BackupState>(listener: ((context, state) {
        if (state is BackupLoading) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (ctx) => ProgressLoadingDialog(
                    loadingMsg: 'Loading...',
                  ));
          return;
        }
        if (state is BackupError) {
          Navigator.pop(context);

          Fluttertoast.showToast(msg: state.errorMsg);
          return;
        }
        if (state is BackupSuccess) {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: "Success");
        }
      })),
      BlocListener<RestoreCubit, RestoreState>(listener: ((context, state) {
        if (state is RestoreLoading) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (ctx) => ProgressLoadingDialog(
                    loadingMsg: 'Restoring...',
                  ));
          return;
        }
        if (state is RestoteError) {
          Navigator.pop(context);

          Fluttertoast.showToast(msg: state.errorMsg);
          return;
        }
        if (state is RestoreSuccess) {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: "Success");
        }
      }))
    ], child: SettingsList());
  }
}
