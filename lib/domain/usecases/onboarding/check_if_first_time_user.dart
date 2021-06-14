import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/repositories/application_repository.dart';
import 'package:finq/domain/usecases/usecase.dart';

class CheckIfFirstTimeUser extends UseCase<bool, NoParams> {
  final ApplicationRepository _applicationRepository;

  CheckIfFirstTimeUser(this._applicationRepository);
  @override
  Future<Either<AppError, bool>> call(NoParams params) async =>
      _applicationRepository.isUserPassedOnboarding();
}
