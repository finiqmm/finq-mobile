import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/app_error.dart';

abstract class ApplicationRepository {
  Future<Either<AppError, void>> finishedOnboarding();
  Future<Either<AppError, bool>> isUserPassedOnboarding();

  Future<Either<AppError, void>> updateLanguage(String language);
  Future<Either<AppError, String>> getPreferredLanguage();
}
