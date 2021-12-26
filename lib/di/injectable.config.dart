// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i19;
import 'package:http/http.dart' as _i12;
import 'package:injectable/injectable.dart' as _i2;

import '../data/core/api_client.dart' as _i41;
import '../data/data_sources/application_data_source.dart' as _i6;
import '../data/data_sources/article_data_source.dart' as _i42;
import '../data/data_sources/auth_data_source.dart' as _i45;
import '../data/data_sources/loan_calculator_data_source.dart' as _i21;
import '../data/data_sources/transaction_data_source.dart' as _i53;
import '../data/mapper/transaction_entity_mapper.dart' as _i34;
import '../data/repositories/application_repository_impl.dart' as _i8;
import '../data/repositories/article_repository_impl.dart' as _i44;
import '../data/repositories/auth_repository_impl.dart' as _i47;
import '../data/repositories/loan_calculator_repository_impl.dart' as _i23;
import '../data/repositories/transaction_repository_impl.dart' as _i56;
import '../database/finq_db.dart' as _i14;
import '../database/transactions_dao.dart' as _i38;
import '../domain/repositories/application_repository.dart' as _i7;
import '../domain/repositories/article_repository.dart' as _i43;
import '../domain/repositories/authentication_repository.dart' as _i46;
import '../domain/repositories/loan_calculator_repository.dart' as _i22;
import '../domain/repositories/transaction_repository.dart' as _i55;
import '../domain/usecases/article/get_article.dart' as _i48;
import '../domain/usecases/auth/check_passcode_match.dart' as _i11;
import '../domain/usecases/auth/get_passcode.dart' as _i16;
import '../domain/usecases/auth/get_signed_in_user.dart' as _i50;
import '../domain/usecases/auth/remove_passcode.dart' as _i29;
import '../domain/usecases/auth/save_passcode.dart' as _i30;
import '../domain/usecases/auth/sign_in.dart' as _i51;
import '../domain/usecases/auth/sign_out.dart' as _i52;
import '../domain/usecases/languages/get_preferred_language.dart' as _i17;
import '../domain/usecases/languages/update_language.dart' as _i39;
import '../domain/usecases/loan_calculator/get_calculate_loan.dart' as _i49;
import '../domain/usecases/onboarding/check_if_first_time_user.dart' as _i10;
import '../domain/usecases/onboarding/finish_onboarding.dart' as _i13;
import '../domain/usecases/theme/get_preferred_theme.dart' as _i18;
import '../domain/usecases/theme/update_theme.dart' as _i40;
import '../domain/usecases/transactions/delete_transaction.dart' as _i59;
import '../domain/usecases/transactions/get_all_transaction_between_range.dart'
    as _i60;
import '../domain/usecases/transactions/get_all_transaction_by_filter_range.dart'
    as _i61;
import '../domain/usecases/transactions/get_total_transaction_amount.dart'
    as _i62;
import '../domain/usecases/transactions/insert_transaction.dart' as _i65;
import '../domain/usecases/transactions/update_transaction.dart' as _i57;
import '../domain/usecases/use_case_imports.dart' as _i4;
import '../presentation/bloc/app/app_bloc.dart' as _i3;
import '../presentation/bloc/articles/article_bloc.dart' as _i58;
import '../presentation/bloc/auth/auth_bloc.dart' as _i9;
import '../presentation/bloc/blocs.dart' as _i5;
import '../presentation/bloc/home_chart_data/home_chart_data_bloc.dart' as _i63;
import '../presentation/bloc/home_main/home_main_bloc.dart' as _i64;
import '../presentation/bloc/language/language_bloc.dart' as _i20;
import '../presentation/bloc/main_navbar/main_navbar_cubit.dart' as _i24;
import '../presentation/bloc/onboarding/onboarding_bloc.dart' as _i25;
import '../presentation/bloc/pincode/pincode_cubit.dart' as _i26;
import '../presentation/bloc/pincode/pincode_validation/pincode_validation_cubit.dart'
    as _i27;
import '../presentation/bloc/profile/profile_bloc.dart' as _i28;
import '../presentation/bloc/theme/theme_cubit.dart' as _i31;
import '../presentation/bloc/total_amount/total_amount_cubit.dart' as _i32;
import '../presentation/bloc/transaction_entry_validation/transaction_entry_validation_bloc.dart'
    as _i36;
import '../presentation/bloc/transaction_query/transaction_query_cubit.dart'
    as _i54;
import '../presentation/bloc/trasaction_entry/transaction_entry_cubit.dart'
    as _i35;
import '../presentation/mapper/transaction_chart_ui_model_mapper.dart' as _i33;
import '../presentation/mapper/transaction_ui_model_mapper.dart' as _i37;
import 'injectable_module.dart' as _i66; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.factory<_i3.AppBloc>(() => _i3.AppBloc(get<_i4.CheckIfFirstTimeUser>(),
      get<_i4.GetSignedInUser>(), get<_i4.SignOut>(), get<_i5.PincodeCubit>()));
  gh.lazySingleton<_i6.ApplicationDataSource>(
      () => _i6.ApplicationDataSourceImpl());
  gh.lazySingleton<_i7.ApplicationRepository>(
      () => _i8.ApplicationRepositoryImpl(get<_i6.ApplicationDataSource>()));
  gh.factory<_i9.AuthBloc>(() => _i9.AuthBloc(get<_i4.SignIn>()));
  gh.lazySingleton<_i10.CheckIfFirstTimeUser>(
      () => _i10.CheckIfFirstTimeUser(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i11.CheckPasscodeMatch>(
      () => _i11.CheckPasscodeMatch(appRepo: get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i12.Client>(() => injectableModule.client);
  gh.lazySingleton<_i13.FinishOnboarding>(
      () => _i13.FinishOnboarding(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i14.FinqDb>(() => _i14.FinqDb());
  gh.lazySingleton<_i15.FirebaseAuth>(() => injectableModule.firebaseAuth);
  gh.lazySingleton<_i16.GetPasscode>(() => _i16.GetPasscode(
      applicationRepository: get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i17.GetPreferredLanguage>(
      () => _i17.GetPreferredLanguage(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i18.GetPreferredTheme>(
      () => _i18.GetPreferredTheme(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i19.GoogleSignIn>(() => injectableModule.googleSignIn);
  gh.lazySingleton<_i20.LanguageBloc>(() => _i20.LanguageBloc(
      getPreferredLanguage: get<_i4.GetPreferredLanguage>(),
      updateLanguage: get<_i4.UpdateLanguage>()));
  gh.lazySingleton<_i21.LoanCalculatorDataSource>(
      () => _i21.LoanCalculatorDataSourceImpl());
  gh.lazySingleton<_i22.LoanCalculatorRepository>(() =>
      _i23.LoanCalculatorRepositoryImpl(get<_i21.LoanCalculatorDataSource>()));
  gh.lazySingleton<_i24.MainNavbarCubit>(() => _i24.MainNavbarCubit());
  gh.factory<_i25.OnboardingBloc>(() => _i25.OnboardingBloc(
      get<_i4.FinishOnboarding>(), get<_i4.CheckIfFirstTimeUser>()));
  gh.lazySingleton<_i26.PincodeCubit>(() => _i26.PincodeCubit(
      get<_i4.SavePasscode>(),
      get<_i4.CheckPasscodeMatch>(),
      get<_i4.GetPasscode>(),
      get<_i4.RemovePasscode>()));
  gh.factory<_i27.PincodeValidationCubit>(() => _i27.PincodeValidationCubit());
  gh.factory<_i28.ProfileBloc>(
      () => _i28.ProfileBloc(get<_i4.GetSignedInUser>()));
  gh.lazySingleton<_i29.RemovePasscode>(() => _i29.RemovePasscode(
      applicationRepository: get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i30.SavePasscode>(() => _i30.SavePasscode(
      applicationRepository: get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i31.ThemeCubit>(() => _i31.ThemeCubit(
      getPreferredTheme: get<_i4.GetPreferredTheme>(),
      updateTheme: get<_i4.UpdateTheme>()));
  gh.factory<_i32.TotalAmountCubit>(() => _i32.TotalAmountCubit(
      getTotalTransactionAmount: get<_i4.GetTotalTransactionAmount>()));
  gh.factory<_i33.TransactionChartUiModelMapper>(
      () => _i33.TransactionChartUiModelMapper());
  gh.factory<_i34.TransactionEntityMapper>(
      () => _i34.TransactionEntityMapper());
  gh.factory<_i35.TransactionEntryCubit>(() => _i35.TransactionEntryCubit(
      insertTransaction: get<_i4.InsertTransaction>(),
      updateTransaction: get<_i4.UpdateTransaction>(),
      deleteTransaction: get<_i4.DeleteTransaction>()));
  gh.factory<_i36.TransactionEntryValidationBloc>(
      () => _i36.TransactionEntryValidationBloc());
  gh.factory<_i37.TransactionUiModelMapper>(
      () => _i37.TransactionUiModelMapper());
  gh.lazySingleton<_i38.TransactionsDao>(
      () => _i38.TransactionsDao(get<_i14.FinqDb>()));
  gh.lazySingleton<_i39.UpdateLanguage>(
      () => _i39.UpdateLanguage(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i40.UpdateTheme>(
      () => _i40.UpdateTheme(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i41.ApiClient>(() => _i41.ApiClient(get<_i12.Client>()));
  gh.lazySingleton<_i42.ArticleDataSource>(
      () => _i42.ArticleDataSourceImpl(get<_i41.ApiClient>()));
  gh.lazySingleton<_i43.ArticleRepository>(
      () => _i44.ArticleRepositoryImpl(get<_i42.ArticleDataSource>()));
  gh.lazySingleton<_i45.AuthDataSource>(() => _i45.AuthDataSourceImpl(
      get<_i15.FirebaseAuth>(), get<_i19.GoogleSignIn>()));
  gh.lazySingleton<_i46.AuthenticationRepository>(() => _i47.AuthRepositoryImpl(
      get<_i45.AuthDataSource>(), get<_i6.ApplicationDataSource>()));
  gh.lazySingleton<_i48.GetArticle>(
      () => _i48.GetArticle(get<_i43.ArticleRepository>()));
  gh.lazySingleton<_i49.GetCalculatedLoan>(
      () => _i49.GetCalculatedLoan(get<_i22.LoanCalculatorRepository>()));
  gh.lazySingleton<_i50.GetSignedInUser>(() =>
      _i50.GetSignedInUser(authRepo: get<_i46.AuthenticationRepository>()));
  gh.lazySingleton<_i51.SignIn>(
      () => _i51.SignIn(authRepo: get<_i46.AuthenticationRepository>()));
  gh.lazySingleton<_i52.SignOut>(
      () => _i52.SignOut(authRepo: get<_i46.AuthenticationRepository>()));
  gh.lazySingleton<_i53.TransactionDataSource>(
      () => _i53.TransactionDataSourceImpl(get<_i38.TransactionsDao>()));
  gh.factory<_i54.TransactionQueryCubit>(() => _i54.TransactionQueryCubit(
      getAllTransactionBetweenRange: get<_i4.GetAllTransactionBetweenRange>(),
      mapper: get<_i37.TransactionUiModelMapper>()));
  gh.lazySingleton<_i55.TransactionRepository>(() => _i56.TransactionRepoImpl(
      get<_i53.TransactionDataSource>(), get<_i34.TransactionEntityMapper>()));
  gh.lazySingleton<_i57.UpdateTransaction>(() => _i57.UpdateTransaction(
      transactionRepository: get<_i55.TransactionRepository>()));
  gh.factory<_i58.ArticleBloc>(() => _i58.ArticleBloc(get<_i48.GetArticle>()));
  gh.lazySingleton<_i59.DeleteTransaction>(() => _i59.DeleteTransaction(
      transactionRepository: get<_i55.TransactionRepository>()));
  gh.factory<_i60.GetAllTransactionBetweenRange>(() =>
      _i60.GetAllTransactionBetweenRange(get<_i55.TransactionRepository>()));
  gh.lazySingleton<_i61.GetAllTransactionByFilterRange>(() =>
      _i61.GetAllTransactionByFilterRange(get<_i55.TransactionRepository>()));
  gh.lazySingleton<_i62.GetTotalTransactionAmount>(
      () => _i62.GetTotalTransactionAmount(get<_i55.TransactionRepository>()));
  gh.factory<_i63.HomeChartDataBloc>(() => _i63.HomeChartDataBloc(
      getAllTransactionByFilterRange:
          get<_i61.GetAllTransactionByFilterRange>(),
      mapper: get<_i33.TransactionChartUiModelMapper>()));
  gh.factory<_i64.HomeMainBloc>(() => _i64.HomeMainBloc(
      homeChartDataBloc: get<_i63.HomeChartDataBloc>(),
      totalAmountBloc: get<_i5.TotalAmountCubit>(),
      transactionQueryBloc: get<_i5.TransactionQueryCubit>()));
  gh.lazySingleton<_i65.InsertTransaction>(() => _i65.InsertTransaction(
      transactionRepository: get<_i55.TransactionRepository>()));
  return get;
}

class _$InjectableModule extends _i66.InjectableModule {}
