part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class IsUserFinishedOnboarding extends AppEvent {}

class AuthCheckRequested extends AppEvent {}

class SignOutPressedEvent extends AppEvent {}
