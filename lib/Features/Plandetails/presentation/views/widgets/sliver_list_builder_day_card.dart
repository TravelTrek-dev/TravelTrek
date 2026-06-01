import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/day_card.dart';

class SliverListBuilderDayCard extends StatelessWidget {
  const SliverListBuilderDayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 4, 
      itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: DayCard(),
      );
    });
  }
}
