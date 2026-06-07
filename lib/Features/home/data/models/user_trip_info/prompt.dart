import 'package:equatable/equatable.dart';

class Prompt extends Equatable {
  final String? tripId;
  final String? prompt;

  const Prompt({this.tripId, this.prompt});

  factory Prompt.fromJson(Map<String, dynamic> json) => Prompt(
    tripId: json['tripId'] as String?,
    prompt: json['prompt'] as String?,
  );

  Map<String, dynamic> toJson() => {'tripId': tripId, 'prompt': prompt};

  @override
  List<Object?> get props => [tripId, prompt];
}
