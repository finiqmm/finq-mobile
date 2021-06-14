import 'package:finq/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/repositories/application_repository.dart';
import 'package:finq/domain/usecases/usecase.dart';

class FinishOnboarding extends UseCase<void, NoParams> {
  final ApplicationRepository _applicationRepository;

  FinishOnboarding(this._applicationRepository);
  @override
  Future<Either<AppError, void>> call(NoParams params) async =>
      _applicationRepository.finishedOnboarding();
}
