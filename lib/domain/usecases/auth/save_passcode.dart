import 'package:finq/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/passcode_params.dart';
import 'package:finq/domain/repositories/application_repository.dart';
import 'package:finq/domain/usecases/use_case.dart';

class SavePasscode extends UseCase<void, PasscodeParams> {
  final ApplicationRepository applicationRepository;

  SavePasscode({required this.applicationRepository});

  @override
  Future<Either<AppError, void>> call(PasscodeParams params) {
    return applicationRepository.updatePasscode(params.passcodeValue);
  }
}
