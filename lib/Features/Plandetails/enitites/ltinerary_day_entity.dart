import 'package:equatable/equatable.dart';
class ItineraryDayEntity extends Equatable {
  final int dayNumber;
  final String title;
  final String description; 
  final String? highlightMeal; 

  const ItineraryDayEntity({
    required this.dayNumber,
    required this.title,
    required this.description,
    this.highlightMeal,
  });

  @override
  List<Object?> get props => [dayNumber, title, description, highlightMeal];
}