import 'package:finq/data/data_sources/application_data_source.dart';
import 'package:finq/data/repositories/application_repository_impl.dart';
import 'package:finq/domain/repositories/application_repository.dart';
import 'package:finq/domain/usecases/check_if_first_time_user.dart';
import 'package:finq/domain/usecases/finish_onboarding.dart';
import 'package:finq/presentation/bloc/app/app_bloc.dart';
import 'package:finq/presentation/bloc/onboarding/onboarding_bloc.dart';
import 'package:get_it/get_it.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<ApplicationDataSource>(
      () => ApplicationDataSourceImpl());

  getItInstance.registerLazySingleton<ApplicationRepository>(
      () => ApplicationRepositoryImpl(getItInstance()));
  getItInstance.registerLazySingleton<FinishOnboarding>(
      () => FinishOnboarding(getItInstance()));
  getItInstance.registerLazySingleton<CheckIfFirstTimeUser>(
      () => CheckIfFirstTimeUser(getItInstance()));

  getItInstance.registerFactory<OnboardingBloc>(
      () => OnboardingBloc(getItInstance(), getItInstance()));
  getItInstance.registerFactory<AppBloc>(() => AppBloc(getItInstance()));
}
