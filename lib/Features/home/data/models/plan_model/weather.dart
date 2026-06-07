import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final double? avgTempCelsius;
  final String? condition;
  final int? avgHumidity;
  final double? avgWindSpeed;

  const Weather({
    this.avgTempCelsius,
    this.condition,
    this.avgHumidity,
    this.avgWindSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    avgTempCelsius: (json['avgTempCelsius'] as num?)?.toDouble(),
    condition: json['condition'] as String?,
    avgHumidity: (json['avgHumidity'] as num?)?.toInt(),
    avgWindSpeed: (json['avgWindSpeed'] as num?)?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'avgTempCelsius': avgTempCelsius,
    'condition': condition,
    'avgHumidity': avgHumidity,
    'avgWindSpeed': avgWindSpeed,
  };

  @override
  List<Object?> get props {
    return [avgTempCelsius, condition, avgHumidity, avgWindSpeed];
  }
}
