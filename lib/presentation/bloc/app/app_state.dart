part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {}

class OnboardingPassed extends AppState {}

class FirstTimeUser extends AppState {}

class Authenticated extends AppState {}

class UnAuthenticated extends AppState {}
