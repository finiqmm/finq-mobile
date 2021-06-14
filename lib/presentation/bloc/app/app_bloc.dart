import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/usecases/check_if_first_time_user.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final CheckIfFirstTimeUser checkIfFirstTimeUser;

  AppBloc(this.checkIfFirstTimeUser) : super(AppInitial());

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is IsUserFinishedOnboarding) {
      final response = await checkIfFirstTimeUser(NoParams());
      yield response.fold((l) => FirstTimeUser(),
          (r) => r ? OnboardingPassed() : FirstTimeUser());
    }
  }
}
