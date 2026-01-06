import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_chat_app_with_firebase/features/auth/domain/entities/user_entity.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial()) {
    on<LoginRequest>(_loginRequest);
    // on<SignUpRequest>(_signUpRequest);
    // on<LogoutRequest>(_logoutRequest);
  }

  Future<void> _loginRequest(LoginRequest event, Emitter<AuthState> emit) {
    emit(const AuthLoading());
    print(event.email);
    print(event.password);
    return Future.delayed(const Duration(seconds: 2), () {
      emit(
        const AuthSuccess(
          user: UserEntity(email: 'jj', id: 'a'),
        ),
      );
    });
  }
}
