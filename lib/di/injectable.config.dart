// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i16;
import 'package:firebase_storage/firebase_storage.dart' as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i21;
import 'package:http/http.dart' as _i12;
import 'package:injectable/injectable.dart' as _i2;

import '../data/core/api_client.dart' as _i46;
import '../data/data_sources/application_data_source.dart' as _i6;
import '../data/data_sources/article_data_source.dart' as _i47;
import '../data/data_sources/auth_data_source.dart' as _i50;
import '../data/data_sources/backup_data_source.dart' as _i53;
import '../data/data_sources/loan_calculator_data_source.dart' as _i24;
import '../data/data_sources/transaction_data_source.dart' as _i36;
import '../data/mapper/transaction_entity_mapper.dart' as _i37;
import '../data/repositories/application_repository_impl.dart' as _i8;
import '../data/repositories/article_repository_impl.dart' as _i49;
import '../data/repositories/auth_repository_impl.dart' as _i52;
import '../data/repositories/backup_repository_impl.dart' as _i55;
import '../data/repositories/loan_calculator_repository_impl.dart' as _i26;
import '../data/repositories/transaction_repository_impl.dart' as _i41;
import '../database/db_util.dart' as _i14;
import '../domain/repositories/application_repository.dart' as _i7;
import '../domain/repositories/article_repository.dart' as _i48;
import '../domain/repositories/authentication_repository.dart' as _i51;
import '../domain/repositories/backup_repository.dart' as _i54;
import '../domain/repositories/loan_calculator_repository.dart' as _i25;
import '../domain/repositories/transaction_repository.dart' as _i40;
import '../domain/usecases/article/get_article.dart' as _i59;
import '../domain/usecases/auth/check_passcode_match.dart' as _i11;
import '../domain/usecases/auth/get_passcode.dart' as _i18;
import '../domain/usecases/auth/get_signed_in_user.dart' as _i61;
import '../domain/usecases/auth/remove_passcode.dart' as _i31;
import '../domain/usecases/auth/save_passcode.dart' as _i32;
import '../domain/usecases/auth/sign_in.dart' as _i66;
import '../domain/usecases/auth/sign_out.dart' as _i67;
import '../domain/usecases/backup/backup_db.dart' as _i71;
import '../domain/usecases/languages/get_preferred_language.dart' as _i19;
import '../domain/usecases/languages/update_language.dart' as _i43;
import '../domain/usecases/loan_calculator/get_calculate_loan.dart' as _i60;
import '../domain/usecases/onboarding/check_if_first_time_user.dart' as _i10;
import '../domain/usecases/onboarding/finish_onboarding.dart' as _i15;
import '../domain/usecases/theme/get_preferred_theme.dart' as _i20;
import '../domain/usecases/theme/update_theme.dart' as _i44;
import '../domain/usecases/transactions/delete_transaction.dart' as _i56;
import '../domain/usecases/transactions/get_all_transaction_between_range.dart'
    as _i57;
import '../domain/usecases/transactions/get_all_transaction_by_filter_range.dart'
    as _i58;
import '../domain/usecases/transactions/get_total_transaction_amount.dart'
    as _i62;
import '../domain/usecases/transactions/insert_transaction.dart' as _i64;
import '../domain/usecases/transactions/update_transaction.dart' as _i45;
import '../domain/usecases/use_case_imports.dart' as _i4;
import '../presentation/bloc/app/app_bloc.dart' as _i3;
import '../presentation/bloc/articles/article_bloc.dart' as _i69;
import '../presentation/bloc/auth/auth_bloc.dart' as _i70;
import '../presentation/bloc/backup/backup_cubit.dart' as _i9;
import '../presentation/bloc/blocs.dart' as _i5;
import '../presentation/bloc/date_selection/date_selection_cubit.dart' as _i13;
import '../presentation/bloc/home_chart_data/home_chart_data_bloc.dart' as _i63;
import '../presentation/bloc/home_main/home_main_bloc.dart' as _i22;
import '../presentation/bloc/language/language_bloc.dart' as _i23;
import '../presentation/bloc/main_navbar/main_navbar_cubit.dart' as _i27;
import '../presentation/bloc/onboarding/onboarding_bloc.dart' as _i28;
import '../presentation/bloc/pincode/pincode_cubit.dart' as _i65;
import '../presentation/bloc/pincode/pincode_validation/pincode_validation_cubit.dart'
    as _i29;
import '../presentation/bloc/profile/profile_bloc.dart' as _i30;
import '../presentation/bloc/theme/theme_cubit.dart' as _i33;
import '../presentation/bloc/total_amount/total_amount_cubit.dart' as _i34;
import '../presentation/bloc/transaction_entry_validation/transaction_entry_validation_bloc.dart'
    as _i39;
import '../presentation/bloc/transaction_query/transaction_query_cubit.dart'
    as _i68;
import '../presentation/bloc/trasaction_entry/transaction_entry_cubit.dart'
    as _i38;
import '../presentation/mapper/transaction_chart_ui_model_mapper.dart' as _i35;
import '../presentation/mapper/transaction_ui_model_mapper.dart' as _i42;
import 'injectable_module.dart' as _i72; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i9.BackupCubit>(
      () => _i9.BackupCubit(backupDb: get<_i4.BackupDb>()));
  gh.lazySingleton<_i10.CheckIfFirstTimeUser>(
      () => _i10.CheckIfFirstTimeUser(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i11.CheckPasscodeMatch>(
      () => _i11.CheckPasscodeMatch(appRepo: get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i12.Client>(() => injectableModule.client);
  gh.factory<_i13.DateSelectionCubit>(() => _i13.DateSelectionCubit());
  gh.singleton<_i14.DbUtil>(_i14.DbUtil());
  gh.lazySingleton<_i15.FinishOnboarding>(
      () => _i15.FinishOnboarding(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i16.FirebaseAuth>(() => injectableModule.firebaseAuth);
  gh.lazySingleton<_i17.FirebaseStorage>(() => injectableModule.storage);
  gh.lazySingleton<_i18.GetPasscode>(() => _i18.GetPasscode(
      applicationRepository: get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i19.GetPreferredLanguage>(
      () => _i19.GetPreferredLanguage(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i20.GetPreferredTheme>(
      () => _i20.GetPreferredTheme(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i21.GoogleSignIn>(() => injectableModule.googleSignIn);
  gh.factory<_i22.HomeMainBloc>(() => _i22.HomeMainBloc(
      homeChartDataBloc: get<_i5.HomeChartDataBloc>(),
      totalAmountBloc: get<_i5.TotalAmountCubit>(),
      transactionQueryBloc: get<_i5.TransactionQueryCubit>()));
  gh.lazySingleton<_i23.LanguageBloc>(() => _i23.LanguageBloc(
      getPreferredLanguage: get<_i4.GetPreferredLanguage>(),
      updateLanguage: get<_i4.UpdateLanguage>()));
  gh.lazySingleton<_i24.LoanCalculatorDataSource>(
      () => _i24.LoanCalculatorDataSourceImpl());
  gh.lazySingleton<_i25.LoanCalculatorRepository>(() =>
      _i26.LoanCalculatorRepositoryImpl(get<_i24.LoanCalculatorDataSource>()));
  gh.lazySingleton<_i27.MainNavbarCubit>(() => _i27.MainNavbarCubit());
  gh.factory<_i28.OnboardingBloc>(() => _i28.OnboardingBloc(
      get<_i4.FinishOnboarding>(), get<_i4.CheckIfFirstTimeUser>()));
  gh.factory<_i29.PincodeValidationCubit>(() => _i29.PincodeValidationCubit());
  gh.factory<_i30.ProfileBloc>(
      () => _i30.ProfileBloc(get<_i4.GetSignedInUser>()));
  gh.lazySingleton<_i31.RemovePasscode>(() => _i31.RemovePasscode(
      applicationRepository: get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i32.SavePasscode>(() => _i32.SavePasscode(
      applicationRepository: get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i33.ThemeCubit>(() => _i33.ThemeCubit(
      getPreferredTheme: get<_i4.GetPreferredTheme>(),
      updateTheme: get<_i4.UpdateTheme>()));
  gh.factory<_i34.TotalAmountCubit>(() => _i34.TotalAmountCubit(
      getTotalTransactionAmount: get<_i4.GetTotalTransactionAmount>()));
  gh.factory<_i35.TransactionChartUiModelMapper>(
      () => _i35.TransactionChartUiModelMapper());
  gh.lazySingleton<_i36.TransactionDataSource>(
      () => _i36.TransactionDataSourceImpl(get<_i14.DbUtil>()));
  gh.factory<_i37.TransactionEntityMapper>(
      () => _i37.TransactionEntityMapper());
  gh.factory<_i38.TransactionEntryCubit>(() => _i38.TransactionEntryCubit(
      insertTransaction: get<_i4.InsertTransaction>(),
      updateTransaction: get<_i4.UpdateTransaction>(),
      deleteTransaction: get<_i4.DeleteTransaction>()));
  gh.factory<_i39.TransactionEntryValidationBloc>(
      () => _i39.TransactionEntryValidationBloc());
  gh.lazySingleton<_i40.TransactionRepository>(() => _i41.TransactionRepoImpl(
      get<_i36.TransactionDataSource>(), get<_i37.TransactionEntityMapper>()));
  gh.factory<_i42.TransactionUiModelMapper>(
      () => _i42.TransactionUiModelMapper());
  gh.lazySingleton<_i43.UpdateLanguage>(
      () => _i43.UpdateLanguage(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i44.UpdateTheme>(
      () => _i44.UpdateTheme(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i45.UpdateTransaction>(() => _i45.UpdateTransaction(
      transactionRepository: get<_i40.TransactionRepository>()));
  gh.lazySingleton<_i46.ApiClient>(() => _i46.ApiClient(get<_i12.Client>()));
  gh.lazySingleton<_i47.ArticleDataSource>(
      () => _i47.ArticleDataSourceImpl(get<_i46.ApiClient>()));
  gh.lazySingleton<_i48.ArticleRepository>(
      () => _i49.ArticleRepositoryImpl(get<_i47.ArticleDataSource>()));
  gh.lazySingleton<_i50.AuthDataSource>(() => _i50.AuthDataSourceImpl(
      get<_i16.FirebaseAuth>(), get<_i21.GoogleSignIn>()));
  gh.lazySingleton<_i51.AuthenticationRepository>(() => _i52.AuthRepositoryImpl(
      get<_i50.AuthDataSource>(), get<_i6.ApplicationDataSource>()));
  gh.lazySingleton<_i53.BackupDataSource>(() => _i53.BackupDataSourceImpl(
      firebaseStorage: get<_i17.FirebaseStorage>(),
      applicationDataSource: get<_i6.ApplicationDataSource>()));
  gh.lazySingleton<_i54.BackupRepository>(() => _i55.BackupRepositoryImpl(
      dbUtil: get<_i14.DbUtil>(),
      backupDataSource: get<_i53.BackupDataSource>()));
  gh.lazySingleton<_i56.DeleteTransaction>(() => _i56.DeleteTransaction(
      transactionRepository: get<_i40.TransactionRepository>()));
  gh.factory<_i57.GetAllTransactionBetweenRange>(() =>
      _i57.GetAllTransactionBetweenRange(get<_i40.TransactionRepository>()));
  gh.lazySingleton<_i58.GetAllTransactionByFilterRange>(() =>
      _i58.GetAllTransactionByFilterRange(get<_i40.TransactionRepository>()));
  gh.lazySingleton<_i59.GetArticle>(
      () => _i59.GetArticle(get<_i48.ArticleRepository>()));
  gh.lazySingleton<_i60.GetCalculatedLoan>(
      () => _i60.GetCalculatedLoan(get<_i25.LoanCalculatorRepository>()));
  gh.lazySingleton<_i61.GetSignedInUser>(() =>
      _i61.GetSignedInUser(authRepo: get<_i51.AuthenticationRepository>()));
  gh.lazySingleton<_i62.GetTotalTransactionAmount>(
      () => _i62.GetTotalTransactionAmount(get<_i40.TransactionRepository>()));
  gh.factory<_i63.HomeChartDataBloc>(() => _i63.HomeChartDataBloc(
      getAllTransactionByFilterRange:
          get<_i58.GetAllTransactionByFilterRange>(),
      mapper: get<_i35.TransactionChartUiModelMapper>()));
  gh.lazySingleton<_i64.InsertTransaction>(() => _i64.InsertTransaction(
      transactionRepository: get<_i40.TransactionRepository>()));
  gh.lazySingleton<_i65.PincodeCubit>(() => _i65.PincodeCubit(
      get<_i32.SavePasscode>(),
      get<_i11.CheckPasscodeMatch>(),
      get<_i18.GetPasscode>(),
      get<_i4.RemovePasscode>()));
  gh.lazySingleton<_i66.SignIn>(
      () => _i66.SignIn(authRepo: get<_i51.AuthenticationRepository>()));
  gh.lazySingleton<_i67.SignOut>(
      () => _i67.SignOut(authRepo: get<_i51.AuthenticationRepository>()));
  gh.factory<_i68.TransactionQueryCubit>(() => _i68.TransactionQueryCubit(
      getAllTransactionBetweenRange: get<_i4.GetAllTransactionBetweenRange>(),
      mapper: get<_i42.TransactionUiModelMapper>()));
  gh.factory<_i69.ArticleBloc>(() => _i69.ArticleBloc(get<_i59.GetArticle>()));
  gh.factory<_i70.AuthBloc>(() => _i70.AuthBloc(get<_i66.SignIn>()));
  gh.lazySingleton<_i71.BackupDb>(
      () => _i71.BackupDb(backupRepository: get<_i54.BackupRepository>()));
  return get;
}

class _$InjectableModule extends _i72.InjectableModule {}
