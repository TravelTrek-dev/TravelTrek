import 'package:equatable/equatable.dart';
import 'package:travel_trek/Features/Plandetails/enitites/exchange_rate_entity.dart';
import 'package:travel_trek/Features/Plandetails/enitites/ltinerary_day_entity.dart';
import 'package:travel_trek/Features/Plandetails/enitites/travel_tip_entity.dart';

class TravelPlanEntity extends Equatable {
  final String title;
  final String coverImageUrl;
  final int durationDays;
  final String weatherInfo;
  final String budgetLevel;
  final int travelersCount;
  final String dateRange;

  final List<ItineraryDayEntity> itinerary;
  final ExchangeRateEntity exchangeRate;
  final List<TravelTipEntity> travelTips;

  const TravelPlanEntity({
    required this.title,
    required this.coverImageUrl,
    required this.durationDays,
    required this.weatherInfo,
    required this.budgetLevel,
    required this.travelersCount,
    required this.dateRange,
    required this.itinerary,
    required this.exchangeRate,
    required this.travelTips,
  });

  @override
  List<Object?> get props => [
    title,
    coverImageUrl,
    durationDays,
    weatherInfo,
    budgetLevel,
    travelersCount,
    dateRange,
    itinerary,
    exchangeRate,
    travelTips,
  ];
}
