import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/entities/user_entity.dart';

abstract class AuthenticationRepository {
  Future<Either<AppError, void>> signIn();
  Future<Either<AppError, void>> signOut();
  Future<Either<AppError, UserEntity>> getCurrentUser();
  Stream<UserEntity> onAuthStateChange();
}

/// Thrown during the sign in with google process if a failure occurs.
class LogInWithGoogleFailure implements Exception {}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {}
