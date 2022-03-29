// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i18;
import 'package:firebase_storage/firebase_storage.dart' as _i19;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i23;
import 'package:http/http.dart' as _i13;
import 'package:injectable/injectable.dart' as _i2;

import '../data/core/api_client.dart' as _i49;
import '../data/data_sources/application_data_source.dart' as _i6;
import '../data/data_sources/article_data_source.dart' as _i50;
import '../data/data_sources/auth_data_source.dart' as _i53;
import '../data/data_sources/backup_data_source.dart' as _i56;
import '../data/data_sources/loan_calculator_data_source.dart' as _i26;
import '../data/data_sources/transaction_data_source.dart' as _i39;
import '../data/mapper/transaction_entity_mapper.dart' as _i40;
import '../data/repositories/application_repository_impl.dart' as _i8;
import '../data/repositories/article_repository_impl.dart' as _i52;
import '../data/repositories/auth_repository_impl.dart' as _i55;
import '../data/repositories/backup_repository_impl.dart' as _i58;
import '../data/repositories/loan_calculator_repository_impl.dart' as _i28;
import '../data/repositories/transaction_repository_impl.dart' as _i44;
import '../database/db_util.dart' as _i15;
import '../domain/repositories/application_repository.dart' as _i7;
import '../domain/repositories/article_repository.dart' as _i51;
import '../domain/repositories/authentication_repository.dart' as _i54;
import '../domain/repositories/backup_repository.dart' as _i57;
import '../domain/repositories/loan_calculator_repository.dart' as _i27;
import '../domain/repositories/transaction_repository.dart' as _i43;
import '../domain/usecases/article/get_article.dart' as _i63;
import '../domain/usecases/auth/check_passcode_match.dart' as _i12;
import '../domain/usecases/auth/get_passcode.dart' as _i20;
import '../domain/usecases/auth/get_signed_in_user.dart' as _i65;
import '../domain/usecases/auth/remove_passcode.dart' as _i34;
import '../domain/usecases/auth/save_passcode.dart' as _i35;
import '../domain/usecases/auth/sign_in.dart' as _i69;
import '../domain/usecases/auth/sign_out.dart' as _i70;
import '../domain/usecases/backup/backup_db.dart' as _i73;
import '../domain/usecases/backup/check_backup_exist.dart' as _i59;
import '../domain/usecases/languages/get_preferred_language.dart' as _i21;
import '../domain/usecases/languages/update_language.dart' as _i46;
import '../domain/usecases/loan_calculator/get_calculate_loan.dart' as _i64;
import '../domain/usecases/onboarding/check_if_first_time_user.dart' as _i11;
import '../domain/usecases/onboarding/finish_onboarding.dart' as _i17;
import '../domain/usecases/theme/get_preferred_theme.dart' as _i22;
import '../domain/usecases/theme/update_theme.dart' as _i47;
import '../domain/usecases/transactions/delete_transaction.dart' as _i60;
import '../domain/usecases/transactions/get_all_transaction_between_range.dart'
    as _i61;
import '../domain/usecases/transactions/get_all_transaction_by_filter_range.dart'
    as _i62;
import '../domain/usecases/transactions/get_total_transaction_amount.dart'
    as _i66;
import '../domain/usecases/transactions/insert_transaction.dart' as _i68;
import '../domain/usecases/transactions/update_transaction.dart' as _i48;
import '../domain/usecases/use_case_imports.dart' as _i4;
import '../presentation/bloc/app/app_bloc.dart' as _i3;
import '../presentation/bloc/articles/article_bloc.dart' as _i72;
import '../presentation/bloc/auth/auth_bloc.dart' as _i9;
import '../presentation/bloc/backup/backup_cubit.dart' as _i10;
import '../presentation/bloc/backup/file_exist_cubit.dart' as _i16;
import '../presentation/bloc/blocs.dart' as _i5;
import '../presentation/bloc/date_selection/date_selection_cubit.dart' as _i14;
import '../presentation/bloc/home_chart_data/home_chart_data_bloc.dart' as _i67;
import '../presentation/bloc/home_main/home_main_bloc.dart' as _i24;
import '../presentation/bloc/language/language_bloc.dart' as _i25;
import '../presentation/bloc/main_navbar/main_navbar_cubit.dart' as _i29;
import '../presentation/bloc/onboarding/onboarding_bloc.dart' as _i30;
import '../presentation/bloc/pincode/pincode_cubit.dart' as _i31;
import '../presentation/bloc/pincode/pincode_validation/pincode_validation_cubit.dart'
    as _i32;
import '../presentation/bloc/profile/profile_bloc.dart' as _i33;
import '../presentation/bloc/theme/theme_cubit.dart' as _i36;
import '../presentation/bloc/total_amount/total_amount_cubit.dart' as _i37;
import '../presentation/bloc/transaction_entry_validation/transaction_entry_validation_bloc.dart'
    as _i42;
import '../presentation/bloc/transaction_query/transaction_query_cubit.dart'
    as _i71;
import '../presentation/bloc/trasaction_entry/transaction_entry_cubit.dart'
    as _i41;
import '../presentation/mapper/transaction_chart_ui_model_mapper.dart' as _i38;
import '../presentation/mapper/transaction_ui_model_mapper.dart' as _i45;
import 'injectable_module.dart' as _i74; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i10.BackupCubit>(
      () => _i10.BackupCubit(backupDb: get<_i4.BackupDb>()));
  gh.lazySingleton<_i11.CheckIfFirstTimeUser>(
      () => _i11.CheckIfFirstTimeUser(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i12.CheckPasscodeMatch>(
      () => _i12.CheckPasscodeMatch(appRepo: get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i13.Client>(() => injectableModule.client);
  gh.factory<_i14.DateSelectionCubit>(() => _i14.DateSelectionCubit());
  gh.singleton<_i15.DbUtil>(_i15.DbUtil());
  gh.factory<_i16.FileExistCubit>(() =>
      _i16.FileExistCubit(checkBackupDbExist: get<_i4.CheckBackupDbExist>()));
  gh.lazySingleton<_i17.FinishOnboarding>(
      () => _i17.FinishOnboarding(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i18.FirebaseAuth>(() => injectableModule.firebaseAuth);
  gh.lazySingleton<_i19.FirebaseStorage>(() => injectableModule.storage);
  gh.lazySingleton<_i20.GetPasscode>(() => _i20.GetPasscode(
      applicationRepository: get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i21.GetPreferredLanguage>(
      () => _i21.GetPreferredLanguage(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i22.GetPreferredTheme>(
      () => _i22.GetPreferredTheme(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i23.GoogleSignIn>(() => injectableModule.googleSignIn);
  gh.factory<_i24.HomeMainBloc>(() => _i24.HomeMainBloc(
      homeChartDataBloc: get<_i5.HomeChartDataBloc>(),
      totalAmountBloc: get<_i5.TotalAmountCubit>(),
      transactionQueryBloc: get<_i5.TransactionQueryCubit>()));
  gh.lazySingleton<_i25.LanguageBloc>(() => _i25.LanguageBloc(
      getPreferredLanguage: get<_i4.GetPreferredLanguage>(),
      updateLanguage: get<_i4.UpdateLanguage>()));
  gh.lazySingleton<_i26.LoanCalculatorDataSource>(
      () => _i26.LoanCalculatorDataSourceImpl());
  gh.lazySingleton<_i27.LoanCalculatorRepository>(() =>
      _i28.LoanCalculatorRepositoryImpl(get<_i26.LoanCalculatorDataSource>()));
  gh.lazySingleton<_i29.MainNavbarCubit>(() => _i29.MainNavbarCubit());
  gh.factory<_i30.OnboardingBloc>(() => _i30.OnboardingBloc(
      get<_i4.FinishOnboarding>(), get<_i4.CheckIfFirstTimeUser>()));
  gh.lazySingleton<_i31.PincodeCubit>(() => _i31.PincodeCubit(
      get<_i4.SavePasscode>(),
      get<_i12.CheckPasscodeMatch>(),
      get<_i4.GetPasscode>(),
      get<_i4.RemovePasscode>()));
  gh.factory<_i32.PincodeValidationCubit>(() => _i32.PincodeValidationCubit());
  gh.factory<_i33.ProfileBloc>(
      () => _i33.ProfileBloc(get<_i4.GetSignedInUser>()));
  gh.lazySingleton<_i34.RemovePasscode>(() => _i34.RemovePasscode(
      applicationRepository: get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i35.SavePasscode>(() => _i35.SavePasscode(
      applicationRepository: get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i36.ThemeCubit>(() => _i36.ThemeCubit(
      getPreferredTheme: get<_i4.GetPreferredTheme>(),
      updateTheme: get<_i4.UpdateTheme>()));
  gh.factory<_i37.TotalAmountCubit>(() => _i37.TotalAmountCubit(
      getTotalTransactionAmount: get<_i4.GetTotalTransactionAmount>()));
  gh.factory<_i38.TransactionChartUiModelMapper>(
      () => _i38.TransactionChartUiModelMapper());
  gh.lazySingleton<_i39.TransactionDataSource>(
      () => _i39.TransactionDataSourceImpl(get<_i15.DbUtil>()));
  gh.factory<_i40.TransactionEntityMapper>(
      () => _i40.TransactionEntityMapper());
  gh.factory<_i41.TransactionEntryCubit>(() => _i41.TransactionEntryCubit(
      insertTransaction: get<_i4.InsertTransaction>(),
      updateTransaction: get<_i4.UpdateTransaction>(),
      deleteTransaction: get<_i4.DeleteTransaction>()));
  gh.factory<_i42.TransactionEntryValidationBloc>(
      () => _i42.TransactionEntryValidationBloc());
  gh.lazySingleton<_i43.TransactionRepository>(() => _i44.TransactionRepoImpl(
      get<_i39.TransactionDataSource>(), get<_i40.TransactionEntityMapper>()));
  gh.factory<_i45.TransactionUiModelMapper>(
      () => _i45.TransactionUiModelMapper());
  gh.lazySingleton<_i46.UpdateLanguage>(
      () => _i46.UpdateLanguage(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i47.UpdateTheme>(
      () => _i47.UpdateTheme(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i48.UpdateTransaction>(() => _i48.UpdateTransaction(
      transactionRepository: get<_i43.TransactionRepository>()));
  gh.lazySingleton<_i49.ApiClient>(() => _i49.ApiClient(get<_i13.Client>()));
  gh.lazySingleton<_i50.ArticleDataSource>(
      () => _i50.ArticleDataSourceImpl(get<_i49.ApiClient>()));
  gh.lazySingleton<_i51.ArticleRepository>(
      () => _i52.ArticleRepositoryImpl(get<_i50.ArticleDataSource>()));
  gh.lazySingleton<_i53.AuthDataSource>(() => _i53.AuthDataSourceImpl(
      get<_i18.FirebaseAuth>(), get<_i23.GoogleSignIn>()));
  gh.lazySingleton<_i54.AuthenticationRepository>(() => _i55.AuthRepositoryImpl(
      get<_i53.AuthDataSource>(), get<_i6.ApplicationDataSource>()));
  gh.lazySingleton<_i56.BackupDataSource>(() => _i56.BackupDataSourceImpl(
      firebaseStorage: get<_i19.FirebaseStorage>(),
      applicationDataSource: get<_i6.ApplicationDataSource>()));
  gh.lazySingleton<_i57.BackupRepository>(() => _i58.BackupRepositoryImpl(
      dbUtil: get<_i15.DbUtil>(),
      backupDataSource: get<_i56.BackupDataSource>()));
  gh.lazySingleton<_i59.CheckBackupDbExist>(() =>
      _i59.CheckBackupDbExist(backupRepository: get<_i57.BackupRepository>()));
  gh.lazySingleton<_i60.DeleteTransaction>(() => _i60.DeleteTransaction(
      transactionRepository: get<_i43.TransactionRepository>()));
  gh.factory<_i61.GetAllTransactionBetweenRange>(() =>
      _i61.GetAllTransactionBetweenRange(get<_i43.TransactionRepository>()));
  gh.lazySingleton<_i62.GetAllTransactionByFilterRange>(() =>
      _i62.GetAllTransactionByFilterRange(get<_i43.TransactionRepository>()));
  gh.lazySingleton<_i63.GetArticle>(
      () => _i63.GetArticle(get<_i51.ArticleRepository>()));
  gh.lazySingleton<_i64.GetCalculatedLoan>(
      () => _i64.GetCalculatedLoan(get<_i27.LoanCalculatorRepository>()));
  gh.lazySingleton<_i65.GetSignedInUser>(() =>
      _i65.GetSignedInUser(authRepo: get<_i54.AuthenticationRepository>()));
  gh.lazySingleton<_i66.GetTotalTransactionAmount>(
      () => _i66.GetTotalTransactionAmount(get<_i43.TransactionRepository>()));
  gh.factory<_i67.HomeChartDataBloc>(() => _i67.HomeChartDataBloc(
      getAllTransactionByFilterRange:
          get<_i62.GetAllTransactionByFilterRange>(),
      mapper: get<_i38.TransactionChartUiModelMapper>()));
  gh.lazySingleton<_i68.InsertTransaction>(() => _i68.InsertTransaction(
      transactionRepository: get<_i43.TransactionRepository>()));
  gh.lazySingleton<_i69.SignIn>(
      () => _i69.SignIn(authRepo: get<_i54.AuthenticationRepository>()));
  gh.lazySingleton<_i70.SignOut>(
      () => _i70.SignOut(authRepo: get<_i54.AuthenticationRepository>()));
  gh.factory<_i71.TransactionQueryCubit>(() => _i71.TransactionQueryCubit(
      getAllTransactionBetweenRange: get<_i4.GetAllTransactionBetweenRange>(),
      mapper: get<_i45.TransactionUiModelMapper>()));
  gh.factory<_i72.ArticleBloc>(() => _i72.ArticleBloc(get<_i63.GetArticle>()));
  gh.lazySingleton<_i73.BackupDb>(
      () => _i73.BackupDb(backupRepository: get<_i57.BackupRepository>()));
  return get;
}

class _$InjectableModule extends _i74.InjectableModule {}
