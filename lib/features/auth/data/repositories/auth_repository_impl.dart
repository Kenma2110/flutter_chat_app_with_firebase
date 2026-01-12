import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_firebase_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebaseSource _firebaseSource;

  AuthRepositoryImpl(this._firebaseSource);

  @override
  Future<UserEntity> loginWithEmail({
    required String email,
    required String password,
  }) async {
    return await _firebaseSource.login(email: email, password: password);
  }

  @override
  Future<UserEntity> signupWithEmail({
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
}
