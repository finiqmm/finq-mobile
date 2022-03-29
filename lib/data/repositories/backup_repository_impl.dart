import 'package:finq/database/db_util.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:finq/domain/repositories/backup_repository.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/backup_data_source.dart';

@LazySingleton(as: BackupRepository)
class BackupRepositoryImpl implements BackupRepository {
  final BackupDataSource backupDataSource;
  final DbUtil dbUtil;

  BackupRepositoryImpl({required this.dbUtil, required this.backupDataSource});

  @override
  Future<Either<AppError, void>> backupFile() async {
    try {
      final backupFile = await dbUtil.backUpDatabase();
      final response = await backupDataSource.uploadDbFile(backupFile);
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.unauthorised, "Can't backup"));
    }
  }

  @override
  Future<Either<AppError, bool>> checkFileExist() async {
    try {
      final response = await backupDataSource.checkFileExist();
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.unauthorised, "Can't backup"));
    }
  }
}
