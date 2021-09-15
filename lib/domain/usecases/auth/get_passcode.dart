import 'package:finq/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/repositories/application_repository.dart';
import 'package:finq/domain/usecases/use_case.dart';

import 'package:injectable/injectable.dart';

@lazySingleton
class GetPasscode extends UseCase<int?, NoParams> {
  final ApplicationRepository applicationRepository;

  GetPasscode({required this.applicationRepository});

  @override
  Future<Either<AppError, int?>> call(NoParams params) {
    return applicationRepository.getPasscode();
  }
}
