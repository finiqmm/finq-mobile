import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/domain/repositories/application_repository.dart';

import '../use_case.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateTheme extends UseCase<void, String> {
  final ApplicationRepository appRepository;

  UpdateTheme(this.appRepository);

  @override
  Future<Either<AppError, void>> call(String themeName) async {
    return await appRepository.updateTheme(themeName);
  }
}
