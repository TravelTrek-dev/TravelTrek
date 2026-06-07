import 'package:equatable/equatable.dart';

import 'prompt.dart';

class Value extends Equatable {
  final String? userId;
  final List<Prompt>? prompts;

  const Value({this.userId, this.prompts});

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    userId: json['userId'] as String?,
    prompts: (json['prompts'] as List<dynamic>?)
        ?.map((e) => Prompt.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'prompts': prompts?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [userId, prompts];
}
