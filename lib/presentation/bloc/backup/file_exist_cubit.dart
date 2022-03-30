import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/usecases/use_case_imports.dart';
import 'package:injectable/injectable.dart';

part 'file_exist_state.dart';

@injectable
class FileExistCubit extends Cubit<FileExistState> {
  final CheckBackupDbExist checkBackupDbExist;
  FileExistCubit({required this.checkBackupDbExist})
      : super(FileExistInitial());

  void isFileExist() async {
    final result = await checkBackupDbExist(NoParams());
    emit(result.fold((l) => BackupFileNotExist(),
        (r) => r ? BackupFileExistedState() : BackupFileNotExist()));
  }
}
