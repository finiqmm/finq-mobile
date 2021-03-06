import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/app_error.dart';

abstract class BackupRepository {
  Future<Either<AppError, void>> backupFile();
  Future<Either<AppError, bool>> checkFileExist();
  Future<Either<AppError, void>> downloadFile();
}
