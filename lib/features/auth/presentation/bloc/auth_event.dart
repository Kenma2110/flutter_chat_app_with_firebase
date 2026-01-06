part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class LoginRequest extends AuthEvent {
  final String email;
  final String password;
  const LoginRequest({required this.email, required this.password});
}

class SignUpRequest extends AuthEvent {
  final String email;
  final String password;
  const SignUpRequest({required this.email, required this.password});
}

class LogoutRequest extends AuthEvent {
  const LogoutRequest();
}
