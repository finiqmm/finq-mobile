import 'package:dartz/dartz.dart';
import 'package:finq/data/data_sources/application_data_source.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/repositories/application_repository.dart';

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
}
