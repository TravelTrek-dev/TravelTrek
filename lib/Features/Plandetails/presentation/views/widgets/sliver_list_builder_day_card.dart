import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/day_card.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/day.dart';

class SliverListBuilderDayCard extends StatelessWidget {
  const SliverListBuilderDayCard({super.key, required this.days});

  final List<Day>? days;

  @override
  Widget build(BuildContext context) {
    final dayCount = days?.length ?? 1;

    return SliverList.builder(
      itemCount: dayCount,
      itemBuilder: (context, index) {
        final day = (days != null && days!.isNotEmpty) ? days![index] : null;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: DayCard(day: day, index: index),
        );
      },
    );
  }
}
