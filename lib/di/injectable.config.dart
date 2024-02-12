// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:finq/data/core/api_client.dart' as _i37;
import 'package:finq/data/data_sources/application_data_source.dart' as _i3;
import 'package:finq/data/data_sources/article_data_source.dart' as _i38;
import 'package:finq/data/data_sources/auth_data_source.dart' as _i41;
import 'package:finq/data/data_sources/backup_data_source.dart' as _i44;
import 'package:finq/data/data_sources/loan_calculator_data_source.dart'
    as _i18;
import 'package:finq/data/data_sources/transaction_data_source.dart' as _i28;
import 'package:finq/data/mapper/transaction_entity_mapper.dart' as _i29;
import 'package:finq/data/repositories/application_repository_impl.dart' as _i5;
import 'package:finq/data/repositories/article_repository_impl.dart' as _i40;
import 'package:finq/data/repositories/auth_repository_impl.dart' as _i43;
import 'package:finq/data/repositories/backup_repository_impl.dart' as _i46;
import 'package:finq/data/repositories/loan_calculator_repository_impl.dart'
    as _i20;
import 'package:finq/data/repositories/transaction_repository_impl.dart'
    as _i32;
import 'package:finq/database/db_util.dart' as _i10;
import 'package:finq/di/injectable_module.dart' as _i76;
import 'package:finq/domain/repositories/application_repository.dart' as _i4;
import 'package:finq/domain/repositories/article_repository.dart' as _i39;
import 'package:finq/domain/repositories/authentication_repository.dart'
    as _i42;
import 'package:finq/domain/repositories/backup_repository.dart' as _i45;
import 'package:finq/domain/repositories/loan_calculator_repository.dart'
    as _i19;
import 'package:finq/domain/repositories/transaction_repository.dart' as _i31;
import 'package:finq/domain/usecases/article/get_article.dart' as _i52;
import 'package:finq/domain/usecases/auth/check_passcode_match.dart' as _i7;
import 'package:finq/domain/usecases/auth/get_passcode.dart' as _i14;
import 'package:finq/domain/usecases/auth/get_signed_in_user.dart' as _i54;
import 'package:finq/domain/usecases/auth/remove_passcode.dart' as _i25;
import 'package:finq/domain/usecases/auth/save_passcode.dart' as _i26;
import 'package:finq/domain/usecases/auth/sign_in.dart' as _i62;
import 'package:finq/domain/usecases/auth/sign_out.dart' as _i63;
import 'package:finq/domain/usecases/backup/backup_db.dart' as _i72;
import 'package:finq/domain/usecases/backup/check_backup_exist.dart' as _i47;
import 'package:finq/domain/usecases/backup/restore_db.dart' as _i61;
import 'package:finq/domain/usecases/languages/get_preferred_language.dart'
    as _i15;
import 'package:finq/domain/usecases/languages/update_language.dart' as _i34;
import 'package:finq/domain/usecases/loan_calculator/get_calculate_loan.dart'
    as _i53;
import 'package:finq/domain/usecases/onboarding/check_if_first_time_user.dart'
    as _i6;
import 'package:finq/domain/usecases/onboarding/finish_onboarding.dart' as _i11;
import 'package:finq/domain/usecases/theme/get_preferred_theme.dart' as _i16;
import 'package:finq/domain/usecases/theme/update_theme.dart' as _i35;
import 'package:finq/domain/usecases/transactions/delete_transaction.dart'
    as _i48;
import 'package:finq/domain/usecases/transactions/get_all_transaction_between_range.dart'
    as _i50;
import 'package:finq/domain/usecases/transactions/get_all_transaction_by_filter_range.dart'
    as _i51;
import 'package:finq/domain/usecases/transactions/get_total_transaction_amount.dart'
    as _i55;
import 'package:finq/domain/usecases/transactions/insert_transaction.dart'
    as _i57;
import 'package:finq/domain/usecases/transactions/update_transaction.dart'
    as _i36;
import 'package:finq/domain/usecases/use_case_imports.dart' as _i23;
import 'package:finq/presentation/bloc/app/app_bloc.dart' as _i68;
import 'package:finq/presentation/bloc/articles/article_bloc.dart' as _i70;
import 'package:finq/presentation/bloc/auth/auth_bloc.dart' as _i71;
import 'package:finq/presentation/bloc/backup/backup_cubit.dart' as _i75;
import 'package:finq/presentation/bloc/backup/cubit/restore_cubit.dart' as _i74;
import 'package:finq/presentation/bloc/backup/file_exist_cubit.dart' as _i49;
import 'package:finq/presentation/bloc/blocs.dart' as _i69;
import 'package:finq/presentation/bloc/date_selection/date_selection_cubit.dart'
    as _i9;
import 'package:finq/presentation/bloc/home_chart_data/home_chart_data_bloc.dart'
    as _i56;
import 'package:finq/presentation/bloc/home_main/home_main_bloc.dart' as _i73;
import 'package:finq/presentation/bloc/language/language_bloc.dart' as _i58;
import 'package:finq/presentation/bloc/main_navbar/main_navbar_cubit.dart'
    as _i21;
import 'package:finq/presentation/bloc/onboarding/onboarding_bloc.dart' as _i22;
import 'package:finq/presentation/bloc/pincode/pincode_cubit.dart' as _i59;
import 'package:finq/presentation/bloc/pincode/pincode_validation/pincode_validation_cubit.dart'
    as _i24;
import 'package:finq/presentation/bloc/profile/profile_bloc.dart' as _i60;
import 'package:finq/presentation/bloc/theme/theme_cubit.dart' as _i64;
import 'package:finq/presentation/bloc/total_amount/total_amount_cubit.dart'
    as _i65;
import 'package:finq/presentation/bloc/transaction_entry_validation/transaction_entry_validation_bloc.dart'
    as _i30;
import 'package:finq/presentation/bloc/transaction_query/transaction_query_cubit.dart'
    as _i67;
import 'package:finq/presentation/bloc/trasaction_entry/transaction_entry_cubit.dart'
    as _i66;
import 'package:finq/presentation/mapper/transaction_chart_ui_model_mapper.dart'
    as _i27;
import 'package:finq/presentation/mapper/transaction_ui_model_mapper.dart'
    as _i33;
import 'package:firebase_auth/firebase_auth.dart' as _i12;
import 'package:firebase_storage/firebase_storage.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i17;
import 'package:http/http.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i3.ApplicationDataSource>(
        () => _i3.ApplicationDataSourceImpl());
    gh.lazySingleton<_i4.ApplicationRepository>(
        () => _i5.ApplicationRepositoryImpl(gh<_i3.ApplicationDataSource>()));
    gh.lazySingleton<_i6.CheckIfFirstTimeUser>(
        () => _i6.CheckIfFirstTimeUser(gh<_i4.ApplicationRepository>()));
    gh.lazySingleton<_i7.CheckPasscodeMatch>(
        () => _i7.CheckPasscodeMatch(appRepo: gh<_i4.ApplicationRepository>()));
    gh.lazySingleton<_i8.Client>(() => injectableModule.client);
    gh.factory<_i9.DateSelectionCubit>(() => _i9.DateSelectionCubit());
    gh.singleton<_i10.DbUtil>(_i10.DbUtil());
    gh.lazySingleton<_i11.FinishOnboarding>(
        () => _i11.FinishOnboarding(gh<_i4.ApplicationRepository>()));
    gh.lazySingleton<_i12.FirebaseAuth>(() => injectableModule.firebaseAuth);
    gh.lazySingleton<_i13.FirebaseStorage>(() => injectableModule.storage);
    gh.lazySingleton<_i14.GetPasscode>(() => _i14.GetPasscode(
        applicationRepository: gh<_i4.ApplicationRepository>()));
    gh.lazySingleton<_i15.GetPreferredLanguage>(
        () => _i15.GetPreferredLanguage(gh<_i4.ApplicationRepository>()));
    gh.lazySingleton<_i16.GetPreferredTheme>(
        () => _i16.GetPreferredTheme(gh<_i4.ApplicationRepository>()));
    gh.lazySingleton<_i17.GoogleSignIn>(() => injectableModule.googleSignIn);
    gh.lazySingleton<_i18.LoanCalculatorDataSource>(
        () => _i18.LoanCalculatorDataSourceImpl());
    gh.lazySingleton<_i19.LoanCalculatorRepository>(() =>
        _i20.LoanCalculatorRepositoryImpl(gh<_i18.LoanCalculatorDataSource>()));
    gh.lazySingleton<_i21.MainNavbarCubit>(() => _i21.MainNavbarCubit());
    gh.factory<_i22.OnboardingBloc>(() => _i22.OnboardingBloc(
          gh<_i23.FinishOnboarding>(),
          gh<_i23.CheckIfFirstTimeUser>(),
        ));
    gh.factory<_i24.PincodeValidationCubit>(
        () => _i24.PincodeValidationCubit());
    gh.lazySingleton<_i25.RemovePasscode>(() => _i25.RemovePasscode(
        applicationRepository: gh<_i4.ApplicationRepository>()));
    gh.lazySingleton<_i26.SavePasscode>(() => _i26.SavePasscode(
        applicationRepository: gh<_i4.ApplicationRepository>()));
    gh.factory<_i27.TransactionChartUiModelMapper>(
        () => _i27.TransactionChartUiModelMapper());
    gh.lazySingleton<_i28.TransactionDataSource>(
        () => _i28.TransactionDataSourceImpl(gh<_i10.DbUtil>()));
    gh.factory<_i29.TransactionEntityMapper>(
        () => _i29.TransactionEntityMapper());
    gh.factory<_i30.TransactionEntryValidationBloc>(
        () => _i30.TransactionEntryValidationBloc());
    gh.lazySingleton<_i31.TransactionRepository>(() => _i32.TransactionRepoImpl(
          gh<_i28.TransactionDataSource>(),
          gh<_i29.TransactionEntityMapper>(),
        ));
    gh.factory<_i33.TransactionUiModelMapper>(
        () => _i33.TransactionUiModelMapper());
    gh.lazySingleton<_i34.UpdateLanguage>(
        () => _i34.UpdateLanguage(gh<_i4.ApplicationRepository>()));
    gh.lazySingleton<_i35.UpdateTheme>(
        () => _i35.UpdateTheme(gh<_i4.ApplicationRepository>()));
    gh.lazySingleton<_i36.UpdateTransaction>(() => _i36.UpdateTransaction(
        transactionRepository: gh<_i31.TransactionRepository>()));
    gh.lazySingleton<_i37.ApiClient>(() => _i37.ApiClient(gh<_i8.Client>()));
    gh.lazySingleton<_i38.ArticleDataSource>(
        () => _i38.ArticleDataSourceImpl(gh<_i37.ApiClient>()));
    gh.lazySingleton<_i39.ArticleRepository>(
        () => _i40.ArticleRepositoryImpl(gh<_i38.ArticleDataSource>()));
    gh.lazySingleton<_i41.AuthDataSource>(() => _i41.AuthDataSourceImpl(
          gh<_i12.FirebaseAuth>(),
          gh<_i17.GoogleSignIn>(),
        ));
    gh.lazySingleton<_i42.AuthenticationRepository>(
        () => _i43.AuthRepositoryImpl(
              gh<_i41.AuthDataSource>(),
              gh<_i3.ApplicationDataSource>(),
            ));
    gh.lazySingleton<_i44.BackupDataSource>(() => _i44.BackupDataSourceImpl(
          firebaseStorage: gh<_i13.FirebaseStorage>(),
          applicationDataSource: gh<_i3.ApplicationDataSource>(),
          dbUtil: gh<_i10.DbUtil>(),
        ));
    gh.lazySingleton<_i45.BackupRepository>(() => _i46.BackupRepositoryImpl(
          dbUtil: gh<_i10.DbUtil>(),
          backupDataSource: gh<_i44.BackupDataSource>(),
        ));
    gh.lazySingleton<_i47.CheckBackupDbExist>(() =>
        _i47.CheckBackupDbExist(backupRepository: gh<_i45.BackupRepository>()));
    gh.lazySingleton<_i48.DeleteTransaction>(() => _i48.DeleteTransaction(
        transactionRepository: gh<_i31.TransactionRepository>()));
    gh.factory<_i49.FileExistCubit>(() =>
        _i49.FileExistCubit(checkBackupDbExist: gh<_i23.CheckBackupDbExist>()));
    gh.factory<_i50.GetAllTransactionBetweenRange>(() =>
        _i50.GetAllTransactionBetweenRange(gh<_i31.TransactionRepository>()));
    gh.lazySingleton<_i51.GetAllTransactionByFilterRange>(() =>
        _i51.GetAllTransactionByFilterRange(gh<_i31.TransactionRepository>()));
    gh.lazySingleton<_i52.GetArticle>(
        () => _i52.GetArticle(gh<_i39.ArticleRepository>()));
    gh.lazySingleton<_i53.GetCalculatedLoan>(
        () => _i53.GetCalculatedLoan(gh<_i19.LoanCalculatorRepository>()));
    gh.lazySingleton<_i54.GetSignedInUser>(() =>
        _i54.GetSignedInUser(authRepo: gh<_i42.AuthenticationRepository>()));
    gh.lazySingleton<_i55.GetTotalTransactionAmount>(
        () => _i55.GetTotalTransactionAmount(gh<_i31.TransactionRepository>()));
    gh.factory<_i56.HomeChartDataBloc>(() => _i56.HomeChartDataBloc(
          getAllTransactionByFilterRange:
              gh<_i51.GetAllTransactionByFilterRange>(),
          mapper: gh<_i27.TransactionChartUiModelMapper>(),
        ));
    gh.lazySingleton<_i57.InsertTransaction>(() => _i57.InsertTransaction(
        transactionRepository: gh<_i31.TransactionRepository>()));
    gh.lazySingleton<_i58.LanguageBloc>(() => _i58.LanguageBloc(
          getPreferredLanguage: gh<_i23.GetPreferredLanguage>(),
          updateLanguage: gh<_i23.UpdateLanguage>(),
        ));
    gh.lazySingleton<_i59.PincodeCubit>(() => _i59.PincodeCubit(
          gh<_i26.SavePasscode>(),
          gh<_i7.CheckPasscodeMatch>(),
          gh<_i14.GetPasscode>(),
          gh<_i23.RemovePasscode>(),
        ));
    gh.factory<_i60.ProfileBloc>(
        () => _i60.ProfileBloc(gh<_i23.GetSignedInUser>()));
    gh.lazySingleton<_i61.RestoreDb>(
        () => _i61.RestoreDb(backupRepository: gh<_i45.BackupRepository>()));
    gh.lazySingleton<_i62.SignIn>(
        () => _i62.SignIn(authRepo: gh<_i42.AuthenticationRepository>()));
    gh.lazySingleton<_i63.SignOut>(
        () => _i63.SignOut(authRepo: gh<_i42.AuthenticationRepository>()));
    gh.lazySingleton<_i64.ThemeCubit>(() => _i64.ThemeCubit(
          getPreferredTheme: gh<_i23.GetPreferredTheme>(),
          updateTheme: gh<_i23.UpdateTheme>(),
        ));
    gh.factory<_i65.TotalAmountCubit>(() => _i65.TotalAmountCubit(
        getTotalTransactionAmount: gh<_i23.GetTotalTransactionAmount>()));
    gh.factory<_i66.TransactionEntryCubit>(() => _i66.TransactionEntryCubit(
          insertTransaction: gh<_i23.InsertTransaction>(),
          updateTransaction: gh<_i23.UpdateTransaction>(),
          deleteTransaction: gh<_i23.DeleteTransaction>(),
        ));
    gh.factory<_i67.TransactionQueryCubit>(() => _i67.TransactionQueryCubit(
          getAllTransactionBetweenRange:
              gh<_i23.GetAllTransactionBetweenRange>(),
          mapper: gh<_i33.TransactionUiModelMapper>(),
        ));
    gh.factory<_i68.AppBloc>(() => _i68.AppBloc(
          gh<_i23.CheckIfFirstTimeUser>(),
          gh<_i23.GetSignedInUser>(),
          gh<_i23.SignOut>(),
          gh<_i69.PincodeCubit>(),
        ));
    gh.factory<_i70.ArticleBloc>(() => _i70.ArticleBloc(gh<_i52.GetArticle>()));
    gh.factory<_i71.AuthBloc>(() => _i71.AuthBloc(gh<_i62.SignIn>()));
    gh.lazySingleton<_i72.BackupDb>(
        () => _i72.BackupDb(backupRepository: gh<_i45.BackupRepository>()));
    gh.factory<_i73.HomeMainBloc>(() => _i73.HomeMainBloc(
          homeChartDataBloc: gh<_i69.HomeChartDataBloc>(),
          totalAmountBloc: gh<_i69.TotalAmountCubit>(),
          transactionQueryBloc: gh<_i69.TransactionQueryCubit>(),
        ));
    gh.factory<_i74.RestoreCubit>(
        () => _i74.RestoreCubit(restoreDb: gh<_i23.RestoreDb>()));
    gh.factory<_i75.BackupCubit>(
        () => _i75.BackupCubit(backupDb: gh<_i23.BackupDb>()));
    return this;
  }
}

class _$InjectableModule extends _i76.InjectableModule {}
