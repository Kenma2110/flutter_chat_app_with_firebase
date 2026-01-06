import 'package:flutter_chat_app_with_firebase/features/auth/data/datasources/auth_firebase_source.dart';
import 'package:flutter_chat_app_with_firebase/features/auth/data/models/user_model.dart';

class AuthFirebaseSourceImpl implements AuthFirebaseSource {
  @override
  Future<UserModel> login(String email, String password) async {
    // FirebaseAuth logic here
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signup(String email, String password) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
