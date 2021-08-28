import 'package:finq/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/passcode_params.dart';
import 'package:finq/domain/repositories/application_repository.dart';
import 'package:finq/domain/usecases/use_case.dart';

class CheckPasscodeMatch extends UseCase<bool, PasscodeParams> {
  final ApplicationRepository appRepo;
  CheckPasscodeMatch({required this.appRepo});
  @override
  Future<Either<AppError, bool>> call(PasscodeParams params) {
    return appRepo.checkPasscodematch(params.passcodeValue);
  }
}
