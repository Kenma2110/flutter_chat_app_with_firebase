import 'package:flutter_chat_app_with_firebase/features/auth/data/models/user_model.dart';

abstract class AuthFirebaseSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> signup(String email, String password);
}
