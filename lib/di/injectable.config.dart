// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i17;
import 'package:firebase_storage/firebase_storage.dart' as _i18;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i22;
import 'package:http/http.dart' as _i12;
import 'package:injectable/injectable.dart' as _i2;

import '../data/core/api_client.dart' as _i48;
import '../data/data_sources/application_data_source.dart' as _i6;
import '../data/data_sources/article_data_source.dart' as _i49;
import '../data/data_sources/auth_data_source.dart' as _i52;
import '../data/data_sources/backup_data_source.dart' as _i55;
import '../data/data_sources/loan_calculator_data_source.dart' as _i24;
import '../data/data_sources/transaction_data_source.dart' as _i38;
import '../data/mapper/transaction_entity_mapper.dart' as _i39;
import '../data/repositories/application_repository_impl.dart' as _i8;
import '../data/repositories/article_repository_impl.dart' as _i51;
import '../data/repositories/auth_repository_impl.dart' as _i54;
import '../data/repositories/backup_repository_impl.dart' as _i57;
import '../data/repositories/loan_calculator_repository_impl.dart' as _i26;
import '../data/repositories/transaction_repository_impl.dart' as _i43;
import '../database/db_util.dart' as _i14;
import '../domain/repositories/application_repository.dart' as _i7;
import '../domain/repositories/article_repository.dart' as _i50;
import '../domain/repositories/authentication_repository.dart' as _i53;
import '../domain/repositories/backup_repository.dart' as _i56;
import '../domain/repositories/loan_calculator_repository.dart' as _i25;
import '../domain/repositories/transaction_repository.dart' as _i42;
import '../domain/usecases/article/get_article.dart' as _i62;
import '../domain/usecases/auth/check_passcode_match.dart' as _i11;
import '../domain/usecases/auth/get_passcode.dart' as _i19;
import '../domain/usecases/auth/get_signed_in_user.dart' as _i64;
import '../domain/usecases/auth/remove_passcode.dart' as _i32;
import '../domain/usecases/auth/save_passcode.dart' as _i34;
import '../domain/usecases/auth/sign_in.dart' as _i70;
import '../domain/usecases/auth/sign_out.dart' as _i71;
import '../domain/usecases/backup/backup_db.dart' as _i75;
import '../domain/usecases/backup/check_backup_exist.dart' as _i58;
import '../domain/usecases/backup/restore_db.dart' as _i69;
import '../domain/usecases/languages/get_preferred_language.dart' as _i20;
import '../domain/usecases/languages/update_language.dart' as _i45;
import '../domain/usecases/loan_calculator/get_calculate_loan.dart' as _i63;
import '../domain/usecases/onboarding/check_if_first_time_user.dart' as _i10;
import '../domain/usecases/onboarding/finish_onboarding.dart' as _i16;
import '../domain/usecases/theme/get_preferred_theme.dart' as _i21;
import '../domain/usecases/theme/update_theme.dart' as _i46;
import '../domain/usecases/transactions/delete_transaction.dart' as _i59;
import '../domain/usecases/transactions/get_all_transaction_between_range.dart'
    as _i60;
import '../domain/usecases/transactions/get_all_transaction_by_filter_range.dart'
    as _i61;
import '../domain/usecases/transactions/get_total_transaction_amount.dart'
    as _i65;
import '../domain/usecases/transactions/insert_transaction.dart' as _i68;
import '../domain/usecases/transactions/update_transaction.dart' as _i47;
import '../domain/usecases/use_case_imports.dart' as _i4;
import '../presentation/bloc/app/app_bloc.dart' as _i3;
import '../presentation/bloc/articles/article_bloc.dart' as _i73;
import '../presentation/bloc/auth/auth_bloc.dart' as _i74;
import '../presentation/bloc/backup/backup_cubit.dart' as _i9;
import '../presentation/bloc/backup/cubit/restore_cubit.dart' as _i33;
import '../presentation/bloc/backup/file_exist_cubit.dart' as _i15;
import '../presentation/bloc/blocs.dart' as _i5;
import '../presentation/bloc/date_selection/date_selection_cubit.dart' as _i13;
import '../presentation/bloc/home_chart_data/home_chart_data_bloc.dart' as _i66;
import '../presentation/bloc/home_main/home_main_bloc.dart' as _i67;
import '../presentation/bloc/language/language_bloc.dart' as _i23;
import '../presentation/bloc/main_navbar/main_navbar_cubit.dart' as _i27;
import '../presentation/bloc/onboarding/onboarding_bloc.dart' as _i28;
import '../presentation/bloc/pincode/pincode_cubit.dart' as _i29;
import '../presentation/bloc/pincode/pincode_validation/pincode_validation_cubit.dart'
    as _i30;
import '../presentation/bloc/profile/profile_bloc.dart' as _i31;
import '../presentation/bloc/theme/theme_cubit.dart' as _i35;
import '../presentation/bloc/total_amount/total_amount_cubit.dart' as _i36;
import '../presentation/bloc/transaction_entry_validation/transaction_entry_validation_bloc.dart'
    as _i41;
import '../presentation/bloc/transaction_query/transaction_query_cubit.dart'
    as _i72;
import '../presentation/bloc/trasaction_entry/transaction_entry_cubit.dart'
    as _i40;
import '../presentation/mapper/transaction_chart_ui_model_mapper.dart' as _i37;
import '../presentation/mapper/transaction_ui_model_mapper.dart' as _i44;
import 'injectable_module.dart' as _i76; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i15.FileExistCubit>(() =>
      _i15.FileExistCubit(checkBackupDbExist: get<_i4.CheckBackupDbExist>()));
  gh.lazySingleton<_i16.FinishOnboarding>(
      () => _i16.FinishOnboarding(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i17.FirebaseAuth>(() => injectableModule.firebaseAuth);
  gh.lazySingleton<_i18.FirebaseStorage>(() => injectableModule.storage);
  gh.lazySingleton<_i19.GetPasscode>(() => _i19.GetPasscode(
      applicationRepository: get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i20.GetPreferredLanguage>(
      () => _i20.GetPreferredLanguage(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i21.GetPreferredTheme>(
      () => _i21.GetPreferredTheme(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i22.GoogleSignIn>(() => injectableModule.googleSignIn);
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
  gh.lazySingleton<_i29.PincodeCubit>(() => _i29.PincodeCubit(
      get<_i4.SavePasscode>(),
      get<_i11.CheckPasscodeMatch>(),
      get<_i4.GetPasscode>(),
      get<_i4.RemovePasscode>()));
  gh.factory<_i30.PincodeValidationCubit>(() => _i30.PincodeValidationCubit());
  gh.factory<_i31.ProfileBloc>(
      () => _i31.ProfileBloc(get<_i4.GetSignedInUser>()));
  gh.lazySingleton<_i32.RemovePasscode>(() => _i32.RemovePasscode(
      applicationRepository: get<_i7.ApplicationRepository>()));
  gh.factory<_i33.RestoreCubit>(
      () => _i33.RestoreCubit(restoreDb: get<_i4.RestoreDb>()));
  gh.lazySingleton<_i34.SavePasscode>(() => _i34.SavePasscode(
      applicationRepository: get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i35.ThemeCubit>(() => _i35.ThemeCubit(
      getPreferredTheme: get<_i4.GetPreferredTheme>(),
      updateTheme: get<_i4.UpdateTheme>()));
  gh.factory<_i36.TotalAmountCubit>(() => _i36.TotalAmountCubit(
      getTotalTransactionAmount: get<_i4.GetTotalTransactionAmount>()));
  gh.factory<_i37.TransactionChartUiModelMapper>(
      () => _i37.TransactionChartUiModelMapper());
  gh.lazySingleton<_i38.TransactionDataSource>(
      () => _i38.TransactionDataSourceImpl(get<_i14.DbUtil>()));
  gh.factory<_i39.TransactionEntityMapper>(
      () => _i39.TransactionEntityMapper());
  gh.factory<_i40.TransactionEntryCubit>(() => _i40.TransactionEntryCubit(
      insertTransaction: get<_i4.InsertTransaction>(),
      updateTransaction: get<_i4.UpdateTransaction>(),
      deleteTransaction: get<_i4.DeleteTransaction>()));
  gh.factory<_i41.TransactionEntryValidationBloc>(
      () => _i41.TransactionEntryValidationBloc());
  gh.lazySingleton<_i42.TransactionRepository>(() => _i43.TransactionRepoImpl(
      get<_i38.TransactionDataSource>(), get<_i39.TransactionEntityMapper>()));
  gh.factory<_i44.TransactionUiModelMapper>(
      () => _i44.TransactionUiModelMapper());
  gh.lazySingleton<_i45.UpdateLanguage>(
      () => _i45.UpdateLanguage(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i46.UpdateTheme>(
      () => _i46.UpdateTheme(get<_i7.ApplicationRepository>()));
  gh.lazySingleton<_i47.UpdateTransaction>(() => _i47.UpdateTransaction(
      transactionRepository: get<_i42.TransactionRepository>()));
  gh.lazySingleton<_i48.ApiClient>(() => _i48.ApiClient(get<_i12.Client>()));
  gh.lazySingleton<_i49.ArticleDataSource>(
      () => _i49.ArticleDataSourceImpl(get<_i48.ApiClient>()));
  gh.lazySingleton<_i50.ArticleRepository>(
      () => _i51.ArticleRepositoryImpl(get<_i49.ArticleDataSource>()));
  gh.lazySingleton<_i52.AuthDataSource>(() => _i52.AuthDataSourceImpl(
      get<_i17.FirebaseAuth>(), get<_i22.GoogleSignIn>()));
  gh.lazySingleton<_i53.AuthenticationRepository>(() => _i54.AuthRepositoryImpl(
      get<_i52.AuthDataSource>(), get<_i6.ApplicationDataSource>()));
  gh.lazySingleton<_i55.BackupDataSource>(() => _i55.BackupDataSourceImpl(
      firebaseStorage: get<_i18.FirebaseStorage>(),
      applicationDataSource: get<_i6.ApplicationDataSource>(),
      dbUtil: get<_i14.DbUtil>()));
  gh.lazySingleton<_i56.BackupRepository>(() => _i57.BackupRepositoryImpl(
      dbUtil: get<_i14.DbUtil>(),
      backupDataSource: get<_i55.BackupDataSource>()));
  gh.lazySingleton<_i58.CheckBackupDbExist>(() =>
      _i58.CheckBackupDbExist(backupRepository: get<_i56.BackupRepository>()));
  gh.lazySingleton<_i59.DeleteTransaction>(() => _i59.DeleteTransaction(
      transactionRepository: get<_i42.TransactionRepository>()));
  gh.factory<_i60.GetAllTransactionBetweenRange>(() =>
      _i60.GetAllTransactionBetweenRange(get<_i42.TransactionRepository>()));
  gh.lazySingleton<_i61.GetAllTransactionByFilterRange>(() =>
      _i61.GetAllTransactionByFilterRange(get<_i42.TransactionRepository>()));
  gh.lazySingleton<_i62.GetArticle>(
      () => _i62.GetArticle(get<_i50.ArticleRepository>()));
  gh.lazySingleton<_i63.GetCalculatedLoan>(
      () => _i63.GetCalculatedLoan(get<_i25.LoanCalculatorRepository>()));
  gh.lazySingleton<_i64.GetSignedInUser>(() =>
      _i64.GetSignedInUser(authRepo: get<_i53.AuthenticationRepository>()));
  gh.lazySingleton<_i65.GetTotalTransactionAmount>(
      () => _i65.GetTotalTransactionAmount(get<_i42.TransactionRepository>()));
  gh.factory<_i66.HomeChartDataBloc>(() => _i66.HomeChartDataBloc(
      getAllTransactionByFilterRange:
          get<_i61.GetAllTransactionByFilterRange>(),
      mapper: get<_i37.TransactionChartUiModelMapper>()));
  gh.factory<_i67.HomeMainBloc>(() => _i67.HomeMainBloc(
      homeChartDataBloc: get<_i66.HomeChartDataBloc>(),
      totalAmountBloc: get<_i5.TotalAmountCubit>(),
      transactionQueryBloc: get<_i5.TransactionQueryCubit>()));
  gh.lazySingleton<_i68.InsertTransaction>(() => _i68.InsertTransaction(
      transactionRepository: get<_i42.TransactionRepository>()));
  gh.lazySingleton<_i69.RestoreDb>(
      () => _i69.RestoreDb(backupRepository: get<_i56.BackupRepository>()));
  gh.lazySingleton<_i70.SignIn>(
      () => _i70.SignIn(authRepo: get<_i53.AuthenticationRepository>()));
  gh.lazySingleton<_i71.SignOut>(
      () => _i71.SignOut(authRepo: get<_i53.AuthenticationRepository>()));
  gh.factory<_i72.TransactionQueryCubit>(() => _i72.TransactionQueryCubit(
      getAllTransactionBetweenRange: get<_i4.GetAllTransactionBetweenRange>(),
      mapper: get<_i44.TransactionUiModelMapper>()));
  gh.factory<_i73.ArticleBloc>(() => _i73.ArticleBloc(get<_i62.GetArticle>()));
  gh.factory<_i74.AuthBloc>(() => _i74.AuthBloc(get<_i70.SignIn>()));
  gh.lazySingleton<_i75.BackupDb>(
      () => _i75.BackupDb(backupRepository: get<_i56.BackupRepository>()));
  return get;
}

class _$InjectableModule extends _i76.InjectableModule {}
