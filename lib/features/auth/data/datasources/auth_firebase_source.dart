import '../../../../core/typedefs/results.dart';
import '../models/user_model.dart';

abstract class AuthFirebaseSource {
  Future<Result<UserModel>> login({
    required String email,
    required String password,
  });

  Future<Result<UserModel>> signup({
    required String name,
    required String email,
    required String password,
  });

  Stream<bool> authStateChanges();

  Future<void> logout();
}
