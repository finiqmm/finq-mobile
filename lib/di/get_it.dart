import 'package:finq/data/core/api_client.dart';
import 'package:finq/data/data_sources/application_data_source.dart';
import 'package:finq/data/data_sources/article_data_source.dart';
import 'package:finq/data/data_sources/auth_data_source.dart';
import 'package:finq/data/data_sources/transaction_data_source.dart';
import 'package:finq/data/mapper/transaction_entity_mapper.dart';
import 'package:finq/data/repositories/application_repository_impl.dart';
import 'package:finq/data/repositories/article_repository_impl.dart';
import 'package:finq/data/repositories/auth_repository_impl.dart';
import 'package:finq/data/repositories/transaction_repository_impl.dart';
import 'package:finq/database/finq_db.dart';
import 'package:finq/domain/repositories/application_repository.dart';
import 'package:finq/domain/repositories/article_repository.dart';
import 'package:finq/domain/repositories/authentication_repository.dart';
import 'package:finq/domain/repositories/transaction_repository.dart';
import 'package:finq/domain/usecases/transactions/get_total_transaction_type.dart';
import 'package:finq/domain/usecases/use_case_imports.dart';

import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/bloc/transaction/transaction_bloc.dart';
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

  ///Db dependencies
  getItInstance.registerLazySingleton<FinqDb>(() => FinqDb());

  ///Mapper dependencies
  getItInstance.registerLazySingleton<TransactionEntityMapper>(
      () => TransactionEntityMapper());

  ///DataSource dependencies
  getItInstance.registerLazySingleton<ApplicationDataSource>(
      () => ApplicationDataSourceImpl());
  getItInstance.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(getItInstance(), getItInstance()));
  getItInstance.registerLazySingleton<ArticleDataSource>(
      () => ArticleDataSourceImpl(getItInstance()));
  getItInstance.registerLazySingleton<TransactionDataSource>(
      () => TransactionDataSourceImpl(getItInstance()));

  ///Repository dependencies
  getItInstance.registerLazySingleton<ApplicationRepository>(
      () => ApplicationRepositoryImpl(getItInstance()));
  getItInstance.registerLazySingleton<ArticleRepository>(
      () => ArticleRepositoryImpl(getItInstance()));
  getItInstance.registerLazySingleton<AuthenticationRepository>(
      () => AuthRepositoryImpl(getItInstance(), getItInstance()));
  getItInstance.registerLazySingleton<TransactionRepository>(
      () => TransactionRepoImpl(getItInstance(), getItInstance()));

  ///Usecase dependencies
  getItInstance.registerLazySingleton<FinishOnboarding>(
      () => FinishOnboarding(getItInstance()));
  getItInstance.registerLazySingleton<CheckIfFirstTimeUser>(
      () => CheckIfFirstTimeUser(getItInstance()));
  getItInstance
      .registerLazySingleton<SignIn>(() => SignIn(authRepo: getItInstance()));
  getItInstance
      .registerLazySingleton<SignOut>(() => SignOut(authRepo: getItInstance()));
  getItInstance.registerLazySingleton<GetPreferredLanguage>(
      () => GetPreferredLanguage(getItInstance()));
  getItInstance.registerLazySingleton<UpdateLanguage>(
      () => UpdateLanguage(getItInstance()));
  getItInstance.registerLazySingleton<GetPreferredTheme>(
      () => GetPreferredTheme(getItInstance()));
  getItInstance
      .registerLazySingleton<UpdateTheme>(() => UpdateTheme(getItInstance()));
  getItInstance.registerLazySingleton<GetSignedInUser>(
      () => GetSignedInUser(authRepo: getItInstance()));
  getItInstance
      .registerLazySingleton<GetArticle>(() => GetArticle(getItInstance()));
  getItInstance.registerLazySingleton<InsertTransaction>(
      () => InsertTransaction(transactionRepository: getItInstance()));
  getItInstance.registerLazySingleton<UpdateTransaction>(
      () => UpdateTransaction(transactionRepository: getItInstance()));

  getItInstance.registerLazySingleton<GetTotalTransactionType>(
      () => GetTotalTransactionType(getItInstance()));

  ///Bloc dependencies
  getItInstance.registerFactory<TransactionBloc>(() => TransactionBloc(
      insertTransaction: getItInstance(),
      updateTransaction: getItInstance(),
      getTotalTransactionType: getItInstance()));
  getItInstance.registerFactory<OnboardingBloc>(
      () => OnboardingBloc(getItInstance(), getItInstance()));
  getItInstance.registerFactory<AppBloc>(
      () => AppBloc(getItInstance(), getItInstance(), getItInstance()));
  getItInstance.registerFactory<AuthBloc>(() => AuthBloc(getItInstance()));
  getItInstance
      .registerFactory<ProfileBloc>(() => ProfileBloc(getItInstance()));
  getItInstance
      .registerFactory<ArticleBloc>(() => ArticleBloc(getItInstance()));

  getItInstance.registerSingleton<ThemeCubit>(ThemeCubit(
    getPreferredTheme: getItInstance(),
    updateTheme: getItInstance(),
  ));
  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc(
      getPreferredLanguage: getItInstance(), updateLanguage: getItInstance()));
}
