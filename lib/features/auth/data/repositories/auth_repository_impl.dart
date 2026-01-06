import 'package:flutter_chat_app_with_firebase/features/auth/data/datasources/auth_firebase_source.dart';
import 'package:flutter_chat_app_with_firebase/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_chat_app_with_firebase/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebaseSource source;

  AuthRepositoryImpl(this.source);

  @override
  Future<UserEntity> loginWithEmail({
    required String email,
    required String password,
  }) {
    // return source.login();
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> signupWithEmail({
    required String email,
    required String password,
  }) {
    // TODO: implement signupWithEmail
    throw UnimplementedError();
  }
}
