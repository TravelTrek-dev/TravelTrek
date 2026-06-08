import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Budget/presentation/views/budget_view.dart';
import 'package:travel_trek/Features/day_details/presentation/views/day_details_view.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/itinerary_view.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';
import 'package:travel_trek/Features/note/presentation/views/tips_view.dart';

class PlanViewDetailsBody extends StatelessWidget {
  const PlanViewDetailsBody({super.key, required this.currentindex, required this.planModel});

  final int currentindex;
  final PlanModel? planModel;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentindex,
      children: [ItineraryView(planModel: planModel), BudgetView(), TipsView(), DayDetailsView()],
    );
  }
}
