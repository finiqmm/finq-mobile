import 'package:dartz/dartz.dart';
import 'package:finq/data/data_sources/application_data_source.dart';
import 'package:finq/data/data_sources/auth_data_source.dart';
import 'package:finq/data/tables/cache_user.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/entities/user_entity.dart';
import 'package:finq/domain/repositories/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pedantic/pedantic.dart';


@LazySingleton(as: AuthenticationRepository)
class AuthRepositoryImpl extends AuthenticationRepository {
  final AuthDataSource authDataSource;
  final ApplicationDataSource appDataSource;

  AuthRepositoryImpl(this.authDataSource, this.appDataSource);

  @override
  @override
  Stream<UserEntity> onAuthStateChange() {
    final authState = authDataSource.getAuthStated();
    return authState.map((e) => UserEntity.fromFirebaseUser(e));
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
      final response = await Future.wait(
          [authDataSource.logoutUser(), appDataSource.deleteCacheUser()]);
      return Right(response);
    } on FirebaseAuthException catch (e) {
      return Left(
          AppError(AppErrorType.unauthorised, e.message ?? "Can't sign out"));
    } on Exception {
      return Left(AppError(AppErrorType.unauthorised, "Can't sign out"));
    }
  }

  @override
  Future<Either<AppError, UserEntity>> getCurrentUser() async {
    UserEntity? userEntity;

    CacheUser? cacheUser = await appDataSource.getCacheUser();
    if (cacheUser != null) {
      userEntity = UserEntity.fromCacheUser(cacheUser);
      return Right(userEntity);
    } else {
      final firebaseUser = await authDataSource.getCurrentUser();
      return firebaseUser.fold(
          () => Left(AppError(AppErrorType.unauthorised, "Can't get user")),
          (a) {
        unawaited(appDataSource.cacheSignInUser(CacheUser.fromFirebaseUser(a)));
        return Right(UserEntity.fromFirebaseUser(a));
      });
    }
  }
}
