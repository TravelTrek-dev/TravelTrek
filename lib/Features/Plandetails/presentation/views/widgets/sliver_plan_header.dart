import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/itinerary_card_header.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/itinerary_card_Info.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';

class SliverPlanHeader extends StatelessWidget {
  const SliverPlanHeader({super.key, required this.planModel});

  final PlanModel? planModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 6),
        ItineraryCardHeader(planModel: planModel),
        ItineraryCardInfo(planModel: planModel),
      ],
    );
  }
}
