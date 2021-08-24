import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/usecases/onboarding/check_if_first_time_user.dart';
import 'package:finq/presentation/bloc/blocs.dart';
import '../../../domain/usecases/use_case_imports.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final CheckIfFirstTimeUser checkIfFirstTimeUser;
  final GetSignedInUser getSignedInUser;
  final SignOut signOut;
  final PincodeCubit passcodeCubit;

  AppBloc(this.checkIfFirstTimeUser, this.getSignedInUser, this.signOut,
      this.passcodeCubit)
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
      });
    }

    if (event is AuthCheckRequested) {
      final response = await getSignedInUser(NoParams());
      yield response.fold((l) => UnAuthenticated(), (r) {
        passcodeCubit.isAppLocked();
        return Authenticated();
      });
    }

    if (event is SignOutPressedEvent) {
      await signOut(NoParams());
      yield UnAuthenticated();
    }
  }
}
