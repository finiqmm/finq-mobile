import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/domain/entities/no_params.dart';
import 'package:finq/domain/entities/user_entity.dart';
import '../../../domain/usecases/use_case_imports.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetSignedInUser getSignedInUser;
  ProfileBloc(this.getSignedInUser) : super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is LoadProfileEvent) {
      final response = await getSignedInUser(NoParams());
      yield response.fold((l) => ProfileLoaded(null), (r) => ProfileLoaded(r));
    }
  }
}
