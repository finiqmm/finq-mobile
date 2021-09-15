import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/usecases/use_case_imports.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

enum Themes { light, dark }

@lazySingleton
class ThemeCubit extends Cubit<Themes> {
  final GetPreferredTheme getPreferredTheme;
  final UpdateTheme updateTheme;

  ThemeCubit({
    required this.getPreferredTheme,
    required this.updateTheme,
  }) : super(Themes.light);

  Future<void> toggleTheme() async {
    await updateTheme(state == Themes.dark ? 'light' : 'dark');
      loadPreferredTheme();
  }

  void loadPreferredTheme() async {
    final response = await getPreferredTheme(NoParams());

    emit(response.fold(
        (l) => Themes.light, (r) => r == 'dark' ? Themes.dark : Themes.light));
  }
}
