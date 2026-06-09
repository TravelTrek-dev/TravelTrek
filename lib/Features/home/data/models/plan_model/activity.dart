import 'package:equatable/equatable.dart';

class Activity extends Equatable {
  final String? name;
  final String? description;
  final String? googleMapsLink;
  final dynamic website;
  final String? imageUrl;
  final String? city;
  final String? approximateCost;
  final String? type;

  const Activity({
    this.name,
    this.description,
    this.googleMapsLink,
    this.website,
    this.city,
    this.approximateCost,
    this.type, this.imageUrl,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
    imageUrl: json['imageUrl'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    googleMapsLink: json['googleMapsLink'] as String?,
    website: json['website'] as dynamic,
    city: json['city'] as String?,
    approximateCost: json['approximateCost'] as String?,
    type: json['type'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'imageUrl' : imageUrl,
    'name': name,
    'description': description,
    'googleMapsLink': googleMapsLink,
    'website': website,
    'city': city,
    'approximateCost': approximateCost,
    'type': type,
  };

  @override
  List<Object?> get props {
    return [
      imageUrl,
      name,
      description,
      googleMapsLink,
      website,
      city,
      approximateCost,
      type,
    ];
  }
}
