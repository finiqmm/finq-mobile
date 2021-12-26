import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecases/use_case_imports.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

@injectable
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final CheckIfFirstTimeUser checkIfFirstTimeUser;
  final FinishOnboarding finishOnboarding;

  OnboardingBloc(this.finishOnboarding, this.checkIfFirstTimeUser)
      : super(OnboardingInitial()) {
    on<OnboardingFinishedEvent>((event, emit) async {
      final response = await finishOnboarding(NoParams());
      emit(response.fold(
        (l) => OnboardingFinished(),
        (r) => OnboardingFinished(),
      ));
    });
  }
}
