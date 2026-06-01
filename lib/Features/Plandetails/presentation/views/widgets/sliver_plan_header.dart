import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/itinerary_card_header.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/itinerary_card_Info.dart';

class SliverPlanHeader extends StatelessWidget {
  const SliverPlanHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 6),
        const ItineraryCardHeader(),
        const ItineraryCardInfo(),
      ],
    );
  }
}
