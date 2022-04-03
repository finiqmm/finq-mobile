
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/usecases/auth/sign_in.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecases/use_case_imports.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignIn signIn;
  AuthBloc(this.signIn) : super(AuthInitial()) {
    on<SignInPressed>((event, emit) async {
      emit(SignInLoading());
      final result = await signIn(NoParams());
      emit( result.fold((l) => SignInError(l.message), (r) => SignInSuccess()));
    });
  }

}
