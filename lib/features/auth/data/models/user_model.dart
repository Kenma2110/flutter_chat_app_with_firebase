import 'package:flutter_chat_app_with_firebase/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.name,
  });

  factory UserModel.fromFirebase(String id, String email, String name) {
    return UserModel(id: id, email: email, name: name);
  }
  @override
  String toString() {
    return '''
      UserModel(
        id: $id,
        name: $name,
        email: $email
      )
    ''';
  }
}
