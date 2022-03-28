import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/usecases/use_case_imports.dart';
import 'package:injectable/injectable.dart';

part 'backup_state.dart';

@injectable
class BackupCubit extends Cubit<BackupState> {
  final BackupDb backupDb;
  BackupCubit({required this.backupDb}) : super(BackupInitial());

  void onBackupDb() async {
    emit(BackupLoading());
    final result = await backupDb(NoParams());
    emit(result.fold((l) => BackupError(l.message), (r) => BackupSuccess()));
  }
}
