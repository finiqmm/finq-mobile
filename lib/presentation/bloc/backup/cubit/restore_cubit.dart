import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/usecases/use_case_imports.dart';
import 'package:injectable/injectable.dart';

part 'restore_state.dart';

@injectable
class RestoreCubit extends Cubit<RestoreState> {
  final RestoreDb restoreDb;
  RestoreCubit({required this.restoreDb}) : super(RestoreInitial());

  void restore() async {
    emit(RestoreLoading());
    final result = await restoreDb(NoParams());
    emit(result.fold((l) => RestoteError(l.message), (r) => RestoreSuccess()));
  }
}
