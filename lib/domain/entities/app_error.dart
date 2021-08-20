import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final AppErrorType appErrorType;
  final String message;

  const AppError(this.appErrorType,this.message);

  @override
  List<Object> get props => [appErrorType,message];
}

enum AppErrorType { api, network, database, unauthorised, userparse,passcode_not_match }

// class AuthError {
//   final String? message;
// }

// class AuthServerError extends AuthError {
//   final String? message;

//   AuthServerError(this.message) : super();
// }
