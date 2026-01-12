import 'package:flutter_chat_app_with_firebase/features/auth/data/models/user_model.dart';

abstract class AuthFirebaseSource {
  Future<UserModel> login({required String email, required String password});
  Future<UserModel> signup({
    required String name,
    required String email,
    required String password,
  });
}
