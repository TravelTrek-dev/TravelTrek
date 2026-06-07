import 'package:equatable/equatable.dart';

class Error extends Equatable {
  final String? code;
  final String? description;
  final int? type;

  const Error({this.code, this.description, this.type});

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    code: json['code'] as String?,
    description: json['description'] as String?,
    type: json['type'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'code': code,
    'description': description,
    'type': type,
  };

  @override
  List<Object?> get props => [code, description, type];
}
