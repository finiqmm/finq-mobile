import 'package:dartz/dartz.dart';
import 'package:finq/data/data_sources/application_data_source.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/repositories/application_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ApplicationRepository)
class ApplicationRepositoryImpl extends ApplicationRepository {
  final ApplicationDataSource applicationDataSource;

  ApplicationRepositoryImpl(this.applicationDataSource);

  @override
  Future<Either<AppError, void>> finishedOnboarding() async {
    try {
      final response = await applicationDataSource.finishedOnboarding();
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database, ""));
    }
  }

  @override
  Future<Either<AppError, bool>> isUserPassedOnboarding() async {
    try {
      final response = await applicationDataSource.isUserPassedOnboarding();
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database, ""));
    }
  }

  @override
  Future<Either<AppError, String>> getPreferredLanguage() async {
    try {
      final response = await applicationDataSource.getPreferredLanguage();
      return Right(response);
    } on Exception {
      return Left(
          AppError(AppErrorType.database, "Error in retrieving language."));
    }
  }

  @override
  Future<Either<AppError, void>> updateLanguage(String language) async {
    try {
      final response = await applicationDataSource.updateLanguage(language);
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database, "Error is saving language."));
    }
  }

  @override
  Future<Either<AppError, String>> getPreferredTheme() async {
    try {
      final response = await applicationDataSource.getPreferredTheme();
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database, "Error in retrieving theme"));
    }
  }

  @override
  Future<Either<AppError, void>> updateTheme(String themeName) async {
    try {
      final response = await applicationDataSource.updateTheme(themeName);
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database, "Error updating theme"));
    }
  }

  @override
  Future<Either<AppError, int?>> getPasscode() async {
    try {
      final response = await applicationDataSource.getPasscodeValue();
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database, "Passcode Error"));
    }
  }

  @override
  Future<Either<AppError, void>> updatePasscode(String value) async {
    try {
      final passcodeValue = int.tryParse(value);
      if (passcodeValue == null) {
        return Left(AppError(AppErrorType.database, "Error updating passcode"));
      }
      final response =
          await applicationDataSource.updatePasscode(passcodeValue);
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database, "Error updating passcode"));
    }
  }

  @override
  Future<Either<AppError, bool>> checkPasscodematch(String passcode) async {
    final response = await this.getPasscode();
    return response.fold(
        (l) => Left(AppError(AppErrorType.passcode_not_match,
            "Error passcode retrieving from db")), (r) {
      final enterPasscode = int.tryParse(passcode);
      if (enterPasscode != null && r != null) {
        debugPrint("AppRepoImpl $enterPasscode --- $r  ${enterPasscode == r}");
        return Right(enterPasscode == r);
      }
      return Left(
          AppError(AppErrorType.passcode_not_match, "Error updating passcode"));
    });
  }

  @override
  Future<Either<AppError, void>> removePasscode(String value) async {
    final response = await this.checkPasscodematch(value);
    return response.fold(
        (l) => Left(AppError(
            AppErrorType.passcode_not_match, "Error removing passcode")),
        (r) async {
      if (r) {
        final deleteResponse =
            await this.applicationDataSource.deletePasscode();
        return Right(deleteResponse);
      }
      return Left(
          AppError(AppErrorType.passcode_not_match, "Passcode not match"));
    });
  }
}
