import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<LoginRequestEvent>(_onLogoutRequestEvent);
    on<SignUpRequestEvent>(_onSignUpRequestEvent);
    on<LogoutRequestEvent>(onLogoutRequestEvent);
  }

  Future<void> _onLogoutRequestEvent(
    LoginRequestEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final result = await _authRepository.loginWithEmail(
        email: event.email,
        password: event.password,
      );
      result.fold(
        (failure) {
          emit(AuthFailure(message: failure.message));
        },
        (user) {
          emit(AuthSuccess(user: user));
        },
      );
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  Future<void> _onSignUpRequestEvent(
    SignUpRequestEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final result = await _authRepository.signupWithEmail(
        name: event.name,
        email: event.email,
        password: event.password,
      );
      result.fold((failure) => emit(AuthFailure(message: failure.message)), (
        user,
      ) {
        emit(AuthSuccess(user: user));
      });
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  Future<void> onLogoutRequestEvent(
    LogoutRequestEvent event,
    Emitter<AuthState> emit,
  ) async {
    await _authRepository.logout();
  }
}
