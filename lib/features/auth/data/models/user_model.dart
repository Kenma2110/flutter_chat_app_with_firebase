import 'package:flutter_chat_app_with_firebase/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({required super.id, required super.email});

  factory UserModel.fromFirebase(String id, String email) {
    return UserModel(id: id, email: email);
  }
}
