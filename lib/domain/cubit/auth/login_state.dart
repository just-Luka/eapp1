part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInital extends LoginState {}

class LoginChecking extends LoginState {}

class LoginSuccessfully extends LoginState {}

class LoginValidationError extends LoginState {
  final Map<String, String?> errorMessage;
  LoginValidationError({
    required this.errorMessage,
  });
}

class LoginCredentialsError extends LoginState {
  final String errorMessage;
  LoginCredentialsError({
    required this.errorMessage,
  });
}
