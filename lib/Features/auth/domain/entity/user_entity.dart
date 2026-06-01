class UserEntity {
  final String name;
  final String email;
  final String uId;
  final String token;

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'uId': uId, 'token': token};
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
      token: json['token'],
    );
  }

  UserEntity({
    required this.name,
    required this.email,
    required this.uId,
    required this.token,
  });
}
