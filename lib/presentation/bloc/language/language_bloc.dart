import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/common/constants/languages.dart';
import 'package:finq/domain/entities/language_entity.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/usecases/use_case_imports.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'language_event.dart';
part 'language_state.dart';

@lazySingleton
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final GetPreferredLanguage getPreferredLanguage;
  final UpdateLanguage updateLanguage;

  LanguageBloc({
    required this.getPreferredLanguage,
    required this.updateLanguage,
  }) : super(LanguageLoaded(Locale(Languages.languages[0].value))) {
    on<ToggleLanguageEvent>((event, emit) async {
      await updateLanguage(event.language.code);
      add(LoadPreferredLanguageEvent());
    });
    on<LoadPreferredLanguageEvent>((event, emit) async {
      final response = await getPreferredLanguage(NoParams());
      emit(response.fold(
        (l) => LanguageError(),
        (r) => LanguageLoaded(Locale(r)),
      ));
    });
  }

  // @override
  // Stream<LanguageState> mapEventToState(
  //   LanguageEvent event,
  // ) async* {
  //   if (event is ToggleLanguageEvent) {
  //     await updateLanguage(event.language.code);
  //     add(LoadPreferredLanguageEvent());
  //   } else if (event is LoadPreferredLanguageEvent) {
  //     final response = await getPreferredLanguage(NoParams());
  //     // debugPrint('Invoke Language $response');

  //     yield response.fold(
  //       (l) => LanguageError(),
  //       (r) => LanguageLoaded(Locale(r)),
  //     );
  //   }
  // }
}
