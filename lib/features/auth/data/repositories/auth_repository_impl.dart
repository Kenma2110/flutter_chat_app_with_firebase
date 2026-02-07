import 'package:flutter_chat_app_with_firebase/core/typedefs/results.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_firebase_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebaseSource _firebaseSource;

  AuthRepositoryImpl(this._firebaseSource);

  @override
  Future<Result<UserEntity>> loginWithEmail({
    required String email,
    required String password,
  }) async {
    return await _firebaseSource.login(email: email, password: password);
  }

  @override
  Future<Result<UserEntity>> signupWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    return await _firebaseSource.signup(
      name: name,
      email: email,
      password: password,
    );
  }

  @override
  Stream<bool> authStateChanges() {
    return _firebaseSource.authStateChanges();
  }

  @override
  Future<void> logout() {
    return _firebaseSource.logout();
  }
}
