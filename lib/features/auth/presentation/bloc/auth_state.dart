part of 'auth_bloc.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccess extends AuthState {
  final UserEntity user;
  const AuthSuccess({required this.user});
}

class AuthError extends AuthState {
  final String message;
  const AuthError({required this.message});
}
