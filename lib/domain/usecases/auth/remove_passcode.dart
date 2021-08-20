import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/entities/passcode_params.dart';
import 'package:finq/domain/repositories/application_repository.dart';

import '../use_case.dart';

class RemovePasscode extends UseCase<void, PasscodeParams> {
  final ApplicationRepository applicationRepository;

  RemovePasscode({required this.applicationRepository});

  @override
  Future<Either<AppError, void>> call(PasscodeParams params) {
    return applicationRepository.removePasscode(params.passcodeValue);
  }
}
