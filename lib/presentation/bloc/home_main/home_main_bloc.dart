import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_main_event.dart';
part 'home_main_state.dart';

class HomeMainBloc extends Bloc<HomeMainEvent, HomeMainState> {
  HomeMainBloc() : super(HomeMainInitial());

  @override
  Stream<HomeMainState> mapEventToState(
    HomeMainEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
