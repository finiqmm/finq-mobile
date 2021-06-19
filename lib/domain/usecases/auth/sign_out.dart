import 'package:finq/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/repositories/authentication_repository.dart';
import 'package:finq/domain/usecases/use_case.dart';

class SignOut extends UseCase<void, NoParams> {
  final AuthenticationRepository authRepo;

  SignOut({required this.authRepo});
  @override
  Future<Either<AppError, void>> call(NoParams params) async {
    return await authRepo.signOut();
  }
}

