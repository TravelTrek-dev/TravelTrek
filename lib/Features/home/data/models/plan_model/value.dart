import 'package:equatable/equatable.dart';

import 'day.dart';
import 'weather.dart';

class Value extends Equatable {
  final String? prompt;
  final String? city;
  final String? country;
  final String? duration;
  final int? budget;
  final String? currency;
  final String? groupSize;
  final Weather? weather;
  final List<Day>? days;
  final List<String>? packingTips;
  final String? generalAdvice;

  const Value({
    this.prompt,
    this.city,
    this.country,
    this.duration,
    this.budget,
    this.currency,
    this.groupSize,
    this.weather,
    this.days,
    this.packingTips,
    this.generalAdvice,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    prompt: json['prompt'] as String?,
    city: json['city'] as String?,
    country: json['country'] as String?,
    duration: json['duration'] as String?,
    budget: json['budget'] as int?,
    currency: json['currency'] as String?,
    groupSize: json['groupSize'] as String?,
    weather: json['weather'] == null
        ? null
        : Weather.fromJson(json['weather'] as Map<String, dynamic>),
    days: (json['days'] as List<dynamic>?)
        ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
        .toList(),
    packingTips: (json['packingTips'] as List?)?.cast<String>(),
    generalAdvice: json['generalAdvice'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'prompt': prompt,
    'city': city,
    'country': country,
    'duration': duration,
    'budget': budget,
    'currency': currency,
    'groupSize': groupSize,
    'weather': weather?.toJson(),
    'days': days?.map((e) => e.toJson()).toList(),
    'packingTips': packingTips,
    'generalAdvice': generalAdvice,
  };

  @override
  List<Object?> get props {
    return [
      prompt,
      city,
      country,
      duration,
      budget,
      currency,
      groupSize,
      weather,
      days,
      packingTips,
      generalAdvice,
    ];
  }
}
