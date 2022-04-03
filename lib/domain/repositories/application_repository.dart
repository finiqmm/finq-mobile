import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/app_error.dart';

abstract class ApplicationRepository {
  Future<Either<AppError, void>> finishedOnboarding();
  Future<Either<AppError, bool>> isUserPassedOnboarding();

  Future<Either<AppError, void>> updateLanguage(String language);
  Future<Either<AppError, String>> getPreferredLanguage();

  Future<Either<AppError, void>> updateTheme(String theme);
  Future<Either<AppError, String>> getPreferredTheme();

  Future<Either<AppError,void>> updatePasscode(String value);
  Future<Either<AppError,int?>> getPasscode();
  Future<Either<AppError,bool>> checkPasscodematch(String passcode);
  Future<Either<AppError,void>> removePasscode(String value);
}
