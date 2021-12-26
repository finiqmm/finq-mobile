import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finq/presentation/journeys/main/main_nav_bar.dart';
import 'package:injectable/injectable.dart';

part 'main_navbar_state.dart';

@lazySingleton
class MainNavbarCubit extends Cubit<PageModel> {
  MainNavbarCubit() : super(PageModel(NavigationBarEvent.HOME, 0));

  void selectPage(int i) {
    switch (i) {
      case 0:
        emit(PageModel(NavigationBarEvent.HOME, i));
        break;
      case 1:
        emit(PageModel(NavigationBarEvent.ARTICLE, i));
        break;
      case 2:
        emit(PageModel(NavigationBarEvent.SETTINGS, i));
        break;
    }
  }
}
