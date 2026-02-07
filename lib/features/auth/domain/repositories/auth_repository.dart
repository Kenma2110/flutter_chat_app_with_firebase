import 'package:flutter_chat_app_with_firebase/core/typedefs/results.dart';
import 'package:flutter_chat_app_with_firebase/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Result<UserEntity>> loginWithEmail({
    required String email,
    required String password,
  });

  Future<Result<UserEntity>> signupWithEmail({
    required String name,
    required String email,
    required String password,
  });

  Stream<bool> authStateChanges();

  Future<void> logout();
}
