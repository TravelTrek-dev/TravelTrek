import 'package:flutter/material.dart';
import 'package:travel_trek/Features/day_details/presentation/views/widgets/day_details_view_body.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';

class DayDetailsView extends StatelessWidget {
  const DayDetailsView({super.key, this.planModel});

  final PlanModel? planModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F4),
      body: DayDetailsViewBody(planModel: planModel),
    );
  }
}
