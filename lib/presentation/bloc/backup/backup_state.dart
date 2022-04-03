part of 'backup_cubit.dart';

abstract class BackupState extends Equatable {
  const BackupState();

  @override
  List<Object> get props => [];
}

class BackupInitial extends BackupState {}

class BackupLoading extends BackupState {}

class BackupError extends BackupState {
  final String errorMsg;
  BackupError(this.errorMsg);
}

class BackupSuccess extends BackupState {}
