import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/repositories/backup_repository.dart';
import 'package:injectable/injectable.dart';

import '../../entities/app_error.dart';
import '../use_case.dart';

@lazySingleton
class BackupDb extends UseCase<void, NoParams> {
  final BackupRepository backupRepository;

  BackupDb({required this.backupRepository});
  @override
  Future<Either<AppError, void>> call(NoParams noParams) async {
    return await backupRepository.backupFile();
  }
}
