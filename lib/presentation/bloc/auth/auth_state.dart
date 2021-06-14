part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class SignInLoading extends AuthState {}

class SignInError extends AuthState {}

class SignInSuccess extends AuthState {}
