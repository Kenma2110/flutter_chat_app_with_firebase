part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class LoginRequestEvent extends AuthEvent {
  final String email;
  final String password;
  const LoginRequestEvent({required this.email, required this.password});
}

class SignUpRequestEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  const SignUpRequestEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}

class LogoutRequestEvent extends AuthEvent {
  const LogoutRequestEvent();
}
