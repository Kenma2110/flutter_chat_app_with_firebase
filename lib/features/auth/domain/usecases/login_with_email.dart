import 'package:flutter_chat_app_with_firebase/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_chat_app_with_firebase/features/auth/domain/repositories/auth_repository.dart';

class LoginWithEmail {
  final AuthRepository repository;

  LoginWithEmail(this.repository);

  Future<UserEntity> call({required String email, required String password}) {
    return repository.loginWithEmail(email: email, password: password);
  }
}
