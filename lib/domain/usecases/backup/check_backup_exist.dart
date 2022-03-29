import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entities/app_error.dart';
import '../../entities/no_params.dart';
import '../../repositories/backup_repository.dart';
import '../use_case.dart';

@lazySingleton
class CheckBackupDbExist extends UseCase<bool, NoParams> {
  final BackupRepository backupRepository;

  CheckBackupDbExist({required this.backupRepository});
  @override
  Future<Either<AppError, bool>> call(NoParams noParams) async {
    return await backupRepository.checkFileExist();
  }
}
