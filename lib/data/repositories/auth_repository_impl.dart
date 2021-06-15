import 'package:dartz/dartz.dart';
import 'package:finq/data/data_sources/auth_data_source.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/entities/user_entity.dart';
import 'package:finq/domain/repositories/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl extends AuthenticationRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  @override
  Stream<UserEntity> onAuthStateChange() {
    final authState = authDataSource.getAuthStated();
    return authState.map((e) => UserEntity.fromUser(e));
  }

  @override
  Future<Either<AppError, void>> signIn() async {
    try {
      final response = await authDataSource.loginWithGoogle();
      return Right(response);
    } on FirebaseAuthException catch (e) {
      return Left(
          AppError(AppErrorType.unauthorised, e.message ?? "Can't signIn"));
    } on Exception {
      return Left(AppError(AppErrorType.unauthorised, "Can't sign in"));
    }
  }

  @override
  Future<Either<AppError, void>> signOut() async {
    try {
      final response = await authDataSource.logoutUser();
      return Right(response);
    } on FirebaseAuthException catch (e) {
      return Left(
          AppError(AppErrorType.unauthorised, e.message ?? "Can't sign out"));
    } on Exception {
      return Left(AppError(AppErrorType.unauthorised, "Can't signIn"));
    }
  }

  @override
  Future<Either<AppError, UserEntity>> getCurrentUser() async {
    final currentUser = await authDataSource.getCurrentUser();
    return currentUser.fold(
        () => Left(AppError(AppErrorType.unauthorised, "Can't get profile")),
        (a) => Right(UserEntity.fromUser(a)));
  }
}