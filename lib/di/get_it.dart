import 'package:finq/data/data_sources/application_data_source.dart';
import 'package:finq/data/data_sources/auth_data_source.dart';
import 'package:finq/data/repositories/application_repository_impl.dart';
import 'package:finq/data/repositories/auth_repository_impl.dart';
import 'package:finq/domain/repositories/application_repository.dart';
import 'package:finq/domain/repositories/authentication_repository.dart';
import 'package:finq/domain/usecases/onboarding/onboarding.dart';
import 'package:finq/domain/usecases/auth/authentication.dart';

import 'package:finq/presentation/bloc/app/app_bloc.dart';
import 'package:finq/presentation/bloc/auth/auth_bloc.dart';
import 'package:finq/presentation/bloc/onboarding/onboarding_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final getItInstance = GetIt.I;

Future init() async {
  ///External dependencies
  getItInstance
      .registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  getItInstance.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());

  ///DataSource dependencies
  getItInstance.registerLazySingleton<ApplicationDataSource>(
      () => ApplicationDataSourceImpl());
  getItInstance.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(getItInstance(), getItInstance()));

  ///Repository dependencies
  getItInstance.registerLazySingleton<ApplicationRepository>(
      () => ApplicationRepositoryImpl(getItInstance()));
  getItInstance.registerLazySingleton<AuthenticationRepository>(
      () => AuthRepositoryImpl(getItInstance()));

  ///Usecase dependencies
  getItInstance.registerLazySingleton<FinishOnboarding>(
      () => FinishOnboarding(getItInstance()));
  getItInstance.registerLazySingleton<CheckIfFirstTimeUser>(
      () => CheckIfFirstTimeUser(getItInstance()));
  getItInstance
      .registerLazySingleton<SignIn>(() => SignIn(authRepo: getItInstance()));
  getItInstance
      .registerLazySingleton<SignOut>(() => SignOut(authRepo: getItInstance()));
  getItInstance.registerLazySingleton<GetSignedInUser>(
      () => GetSignedInUser(authRepo: getItInstance()));

  ///Bloc dependencies
  getItInstance.registerFactory<OnboardingBloc>(
      () => OnboardingBloc(getItInstance(), getItInstance()));
  getItInstance.registerFactory<AppBloc>(
      () => AppBloc(getItInstance(), getItInstance(), getItInstance()));
  getItInstance.registerFactory<AuthBloc>(() => AuthBloc(getItInstance()));
}
