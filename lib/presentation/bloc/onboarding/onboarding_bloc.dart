import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/domain/entities/no_params.dart';
import '../../../domain/usecases/use_case_imports.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final CheckIfFirstTimeUser checkIfFirstTimeUser;
  final FinishOnboarding finishOnboarding;

  OnboardingBloc(this.finishOnboarding, this.checkIfFirstTimeUser)
      : super(OnboardingInitial());

  @override
  Stream<OnboardingState> mapEventToState(
    OnboardingEvent event,
  ) async* {
    if (event is OnboardingFinishedEvent) {
      final response = await finishOnboarding(NoParams());
      yield response.fold(
        (l) => OnboardingFinished(),
        (r) => OnboardingFinished(),
      );
    }
  }
}
