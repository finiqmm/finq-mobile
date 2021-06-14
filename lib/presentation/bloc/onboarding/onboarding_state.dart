part of 'onboarding_bloc.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

class OnboardingInitial extends OnboardingState {}

class OnboardingFinished extends OnboardingState {}


class IsUserPassedOnboarding extends OnboardingState {
  final bool isUserPassesOnboarding;

  IsUserPassedOnboarding(this.isUserPassesOnboarding);

  @override
  List<Object> get props => [isUserPassesOnboarding];
}
