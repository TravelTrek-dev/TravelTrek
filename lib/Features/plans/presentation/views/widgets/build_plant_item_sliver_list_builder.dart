import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/plan_view_details.dart';
import 'package:travel_trek/Features/plans/presentation/domain/entities/plan_entity.dart';
import 'package:travel_trek/Features/plans/presentation/views/widgets/build_plan_item.dart';

class BuildPlanItemsSliverListBuilder extends StatelessWidget {
  const BuildPlanItemsSliverListBuilder({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: mockPlans.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: BuildPlanItem(
            plan: mockPlans[index], 
            onTap: () {
              Navigator.pushNamed(context, PlanViewDetails.routeName);
            },
          ),
        );
      },
    );
  }
}