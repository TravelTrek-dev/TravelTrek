import 'package:travel_trek/core/utils/app_images.dart';

enum PlanStatus { upcoming, draft, past }

class PlanEntity {
  final String id;
  final String title;
  final String location;
  final String dateRange;
  final int daysCount;
  final PlanStatus status;
  final String? imageAsset;

  const PlanEntity({
    required this.id,
    required this.title,
    required this.location,
    required this.dateRange,
    required this.daysCount,
    required this.status,
    this.imageAsset,
  });
}

List<PlanEntity> get mockPlans => [
  const PlanEntity(
    imageAsset: Assets.imagesTestImage,
    id: '1',
    title: 'Summer in Santorini',
    location: 'Santorini, Greece',
    dateRange: 'Aug 15 – Aug 22',
    daysCount: 8,
    status: PlanStatus.upcoming,
  ),
  const PlanEntity(
    imageAsset: Assets.imagesTestImage2,
    id: '2',
    title: 'Tech & Culture',
    location: 'Japan',
    dateRange: 'Oct',
    daysCount: 14,
    status: PlanStatus.draft,
  ),
  const PlanEntity(
    imageAsset: Assets.imagesTestImage3,
    id: '3',
    title: 'Swiss Alps Retreat',
    location: 'Zermatt, Switzerland',
    dateRange: 'Jan 12 – Jan 18',
    daysCount: 7,
    status: PlanStatus.past,
  ),
];
