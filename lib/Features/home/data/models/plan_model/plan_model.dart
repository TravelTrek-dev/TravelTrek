import 'package:equatable/equatable.dart';

import 'error.dart';
import 'value.dart';

class PlanModel extends Equatable {
  final Value? value;
  final List<dynamic>? validationErrors;
  final bool? hasValidationErrors;
  final bool? isSuccess;
  final bool? isFailure;
  final Error? error;

  const PlanModel({
    this.value,
    this.validationErrors,
    this.hasValidationErrors,
    this.isSuccess,
    this.isFailure,
    this.error,
  });
  
  factory PlanModel.fromJson(Map<String, dynamic> json) => PlanModel(
    value: json['value'] == null
        ? null
        : Value.fromJson(json['value'] as Map<String, dynamic>),
    validationErrors: json['validationErrors'] as List<dynamic>?,
    hasValidationErrors: json['hasValidationErrors'] as bool?,
    isSuccess: json['isSuccess'] as bool?,
    isFailure: json['isFailure'] as bool?,
    error: json['error'] == null
        ? null
        : Error.fromJson(json['error'] as Map<String, dynamic>),
  );

  static List<PlanModel> fromHistoryJson(Map<String, dynamic> json) {
    final valuesList = json['value'] as List<dynamic>?;
    
    if (valuesList == null || valuesList.isEmpty) {
      return [];
    }

    final validationErrors = json['validationErrors'] as List<dynamic>?;
    final hasValidationErrors = json['hasValidationErrors'] as bool?;
    final isSuccess = json['isSuccess'] as bool?;
    final isFailure = json['isFailure'] as bool?;
    final error = json['error'] == null
        ? null
        : Error.fromJson(json['error'] as Map<String, dynamic>);

    return valuesList.map((item) {
      return PlanModel(
        value: Value.fromJson(item as Map<String, dynamic>),
        validationErrors: validationErrors,
        hasValidationErrors: hasValidationErrors,
        isSuccess: isSuccess,
        isFailure: isFailure,
        error: error,
      );
    }).toList();
  }

  Map<String, dynamic> toJson() => {
    'value': value?.toJson(),
    'validationErrors': validationErrors,
    'hasValidationErrors': hasValidationErrors,
    'isSuccess': isSuccess,
    'isFailure': isFailure,
    'error': error?.toJson(),
  };

  Map<String, dynamic> toSavePlan() => {
    'prompt': value!.prompt,
    'city': value!.city,
    'country': value!.country,
    'duration': value!.duration,
    'budget': value!.budget,
    'currency': value!.currency,
    'groupSize': value!.groupSize,
    'weather': value!.weather?.toJson(),
    'days': value!.days?.map((e) => e.toJson()).toList(),
    'packingTips': value!.packingTips,
    'generalAdvice': value!.generalAdvice,
  };

  @override
  List<Object?> get props {
    return [
      value,
      validationErrors,
      hasValidationErrors,
      isSuccess,
      isFailure,
      error,
    ];
  }
}