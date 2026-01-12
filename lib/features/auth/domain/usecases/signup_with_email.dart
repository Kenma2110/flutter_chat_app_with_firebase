import 'package:flutter_chat_app_with_firebase/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_chat_app_with_firebase/features/auth/domain/repositories/auth_repository.dart';

class SignupWithEmail {
  final AuthRepository authRepository;
  SignupWithEmail(this.authRepository);

  Future<UserEntity> call({
    required String email,
    required String password,
    required String name,
  }) {
    return authRepository.signupWithEmail(
      email: email,
      password: password,
      name: name,
    );
  }
}
