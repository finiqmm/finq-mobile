import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/usecases/onboarding/check_if_first_time_user.dart';
import '../../../domain/usecases/use_case_imports.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final CheckIfFirstTimeUser checkIfFirstTimeUser;
  final GetSignedInUser getSignedInUser;
  final SignOut signOut;

  AppBloc(this.checkIfFirstTimeUser, this.getSignedInUser, this.signOut)
      : super(AppInitial());

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is IsUserFinishedOnboarding) {
      final response = await checkIfFirstTimeUser(NoParams());
      yield response.fold((l) {
        return FirstTimeUser();
      }, (r) {
        if (r) {
          add(AuthCheckRequested());
          return OnboardingPassed();
        }
        return FirstTimeUser();
        // return r ? OnboardingPassed() : FirstTimeUser();
      });
    }

    if (event is AuthCheckRequested) {
      final response = await getSignedInUser(NoParams());
      yield response.fold((l) => UnAuthenticated(), (r) => Authenticated());
    }

    if (event is SignOutPressedEvent) {
      await signOut(NoParams());
      yield UnAuthenticated();
    }
  }
}
