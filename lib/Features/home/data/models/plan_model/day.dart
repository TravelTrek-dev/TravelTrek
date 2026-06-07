import 'package:equatable/equatable.dart';

import 'activity.dart';
import 'meals.dart';

class Day extends Equatable {
  final int? dayNumber;
  final List<Activity>? activities;
  final Meals? meals;

  const Day({this.dayNumber, this.activities, this.meals});

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    dayNumber: json['dayNumber'] as int?,
    activities: (json['activities'] as List<dynamic>?)
        ?.map((e) => Activity.fromJson(e as Map<String, dynamic>))
        .toList(),
    meals: json['meals'] == null
        ? null
        : Meals.fromJson(json['meals'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'dayNumber': dayNumber,
    'activities': activities?.map((e) => e.toJson()).toList(),
    'meals': meals?.toJson(),
  };

  @override
  List<Object?> get props => [dayNumber, activities, meals];
}
