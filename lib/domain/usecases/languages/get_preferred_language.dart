import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/repositories/application_repository.dart';

import '../use_case.dart';

class GetPreferredLanguage extends UseCase<String, NoParams> {
  final ApplicationRepository appRepository;

  GetPreferredLanguage(this.appRepository);

  @override
  Future<Either<AppError, String>> call(NoParams params) async {
    return await appRepository.getPreferredLanguage();
  }
}
