import 'package:finq/data/core/api_client.dart';
import 'package:finq/data/data_sources/application_data_source.dart';
import 'package:finq/data/data_sources/article_data_source.dart';
import 'package:finq/data/data_sources/auth_data_source.dart';
import 'package:finq/data/repositories/application_repository_impl.dart';
import 'package:finq/data/repositories/article_repository_impl.dart';
import 'package:finq/data/repositories/auth_repository_impl.dart';
import 'package:finq/domain/repositories/application_repository.dart';
import 'package:finq/domain/repositories/article_repository.dart';
import 'package:finq/domain/repositories/authentication_repository.dart';
import 'package:finq/domain/usecases/use_case_imports.dart';

import 'package:finq/presentation/bloc/blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';

final getItInstance = GetIt.I;

Future init() async {
  ///External dependencies
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance
      .registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  getItInstance.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());

  ///DataSource dependencies
  getItInstance.registerLazySingleton<ApplicationDataSource>(
      () => ApplicationDataSourceImpl());
  getItInstance.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(getItInstance(), getItInstance()));
  getItInstance.registerLazySingleton<ArticleDataSource>(
      () => ArticleDataSourceImpl(getItInstance()));

  ///Repository dependencies
  getItInstance.registerLazySingleton<ApplicationRepository>(
      () => ApplicationRepositoryImpl(getItInstance()));
  getItInstance.registerLazySingleton<ArticleRepository>(
      () => ArticleRepositoryImpl(getItInstance()));
  getItInstance.registerLazySingleton<AuthenticationRepository>(
      () => AuthRepositoryImpl(getItInstance(), getItInstance()));

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
  getItInstance
      .registerLazySingleton<GetArticle>(() => GetArticle(getItInstance()));

  ///Bloc dependencies
  getItInstance.registerFactory<OnboardingBloc>(
      () => OnboardingBloc(getItInstance(), getItInstance()));
  getItInstance.registerFactory<AppBloc>(
      () => AppBloc(getItInstance(), getItInstance(), getItInstance()));
  getItInstance.registerFactory<AuthBloc>(() => AuthBloc(getItInstance()));
  getItInstance
      .registerFactory<ProfileBloc>(() => ProfileBloc(getItInstance()));
  getItInstance
      .registerFactory<ArticleBloc>(() => ArticleBloc(getItInstance()));
}
