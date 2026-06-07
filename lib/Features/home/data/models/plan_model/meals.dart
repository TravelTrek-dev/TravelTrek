import 'package:equatable/equatable.dart';

class Meals extends Equatable {
  final String? breakfast;
  final String? lunch;
  final String? dinner;

  const Meals({this.breakfast, this.lunch, this.dinner});

  factory Meals.fromJson(Map<String, dynamic> json) => Meals(
    breakfast: json['breakfast'] as String?,
    lunch: json['lunch'] as String?,
    dinner: json['dinner'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'breakfast': breakfast,
    'lunch': lunch,
    'dinner': dinner,
  };

  @override
  List<Object?> get props => [breakfast, lunch, dinner];
}
