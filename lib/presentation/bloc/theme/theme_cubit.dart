import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/usecases/use_case_imports.dart';
import 'package:injectable/injectable.dart';

enum ThemeBrightness { light, dark }

@lazySingleton
class ThemeCubit extends Cubit<ThemeBrightness> {
  final GetPreferredTheme getPreferredTheme;
  final UpdateTheme updateTheme;

  ThemeCubit({
    required this.getPreferredTheme,
    required this.updateTheme,
  }) : super(ThemeBrightness.light);

  Future<void> toggleTheme() async {
    await updateTheme(state == ThemeBrightness.dark ? 'light' : 'dark');
    loadPreferredTheme();
  }

  void loadPreferredTheme() async {
    final response = await getPreferredTheme(NoParams());

    emit(response.fold(
        (l) => ThemeBrightness.light, (r) => r == 'dark' ? ThemeBrightness.dark : ThemeBrightness.light));
  }
}
