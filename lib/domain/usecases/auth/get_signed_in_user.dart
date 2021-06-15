import 'package:finq/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/entities/user_entity.dart';
import 'package:finq/domain/repositories/authentication_repository.dart';
import 'package:finq/domain/usecases/use_case.dart';

class GetSignedInUser extends UseCase<UserEntity, NoParams> {
  final AuthenticationRepository authRepo;

  GetSignedInUser({required this.authRepo});

  @override
  Future<Either<AppError, UserEntity>> call(NoParams params) {
    return authRepo.getCurrentUser();
  }
}
