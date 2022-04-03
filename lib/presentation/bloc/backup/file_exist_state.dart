part of 'file_exist_cubit.dart';

abstract class FileExistState extends Equatable {
  const FileExistState();

  @override
  List<Object> get props => [];
}

class FileExistInitial extends FileExistState {}

class BackupFileExistedState extends FileExistState {
  BackupFileExistedState() : super();
}

class BackupFileNotExist extends FileExistState {
  BackupFileNotExist() : super();
}
