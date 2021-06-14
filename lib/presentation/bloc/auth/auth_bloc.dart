import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/usecases/auth/SignIn.dart';
import 'package:finq/domain/usecases/auth/authentication.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignIn signIn;
  AuthBloc(this.signIn) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is SignInPressed) {
      yield SignInLoading();
      final result = await signIn(NoParams());
      yield result.fold((l) => SignInError(), (r) => SignInSuccess());
    }
  }
}
