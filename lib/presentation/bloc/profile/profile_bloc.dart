import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecases/use_case_imports.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetSignedInUser getSignedInUser;
  ProfileBloc(this.getSignedInUser) : super(ProfileInitial()) {
    on<LoadProfileEvent>((event, emit)async {
      final response = await getSignedInUser(NoParams());
      emit(response.fold((l) => ProfileLoaded(null), (r) => ProfileLoaded(r)));
    });
  }

  // @override
  // Stream<ProfileState> mapEventToState(
  //   ProfileEvent event,
  // ) async* {
  //   if (event is LoadProfileEvent) {
  //     final response = await getSignedInUser(NoParams());
  //     yield response.fold((l) => ProfileLoaded(null), (r) => ProfileLoaded(r));
  //   }
  // }
}
