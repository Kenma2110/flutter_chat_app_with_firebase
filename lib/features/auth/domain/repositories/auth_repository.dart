import 'package:flutter_chat_app_with_firebase/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> loginWithEmail({
    required String email,
    required String password,
  });

  Future<UserEntity> signupWithEmail({
    required String email,
    required String password,
  });
}
