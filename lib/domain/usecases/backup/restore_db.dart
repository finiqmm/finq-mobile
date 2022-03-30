import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entities/app_error.dart';
import '../../entities/no_params.dart';
import '../../repositories/backup_repository.dart';
import '../use_case.dart';

@lazySingleton
class RestoreDb extends UseCase<void, NoParams> {
  final BackupRepository backupRepository;

  RestoreDb({required this.backupRepository});
  @override
  Future<Either<AppError, void>> call(NoParams noParams) async {
    return await backupRepository.downloadFile();
  }
}
