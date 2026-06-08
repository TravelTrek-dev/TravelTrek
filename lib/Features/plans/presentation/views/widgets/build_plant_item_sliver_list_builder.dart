import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/plan_view_details.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';
import 'package:travel_trek/Features/plans/presentation/views/widgets/build_plan_item.dart';

class BuildPlanItemsSliverListBuilder extends StatelessWidget {
  const BuildPlanItemsSliverListBuilder({
    super.key, required this.plans,
  });
 final List<PlanModel> plans;
  
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: plans.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: BuildPlanItem(
            plan: plans[index],
            onTap: () {
              Navigator.pushNamed(context, PlanViewDetails.routeName , arguments: plans[index]);
            },
          ),
        );
      },
    );
  }
}
