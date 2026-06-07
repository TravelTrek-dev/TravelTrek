import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_trek/Features/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.email,
    required super.uId,
    required super.token,
  });

  factory UserModel.formFireBaseUser({required User user}) {
    return UserModel(
      name: user.displayName ?? 'Alex',
      email: user.email ?? "",
      uId: user.uid,
      token: user.phoneNumber ?? "",
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['value']['user']['fullName'] ?? 'Alex',
      email: json['value']['user']['email'] ?? "",
      uId: json['value']['user']['id'] ?? "id",
      token: json['value']['accessToken'] ?? "accessToken",
    );
  }
}
