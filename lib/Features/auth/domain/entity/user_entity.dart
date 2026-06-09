class UserEntity {
  final String name;
  final String email;
  final String uId;
  final String accessToken;
  final String refreshToken;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'token': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
      accessToken: json['token'],
      refreshToken: json['refreshToken'],
    );
  }

  UserEntity({
    required this.name,
    required this.email,
    required this.uId,
    required this.accessToken,
    required this.refreshToken,
  });
}
