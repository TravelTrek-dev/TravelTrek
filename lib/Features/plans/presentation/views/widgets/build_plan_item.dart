import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/build_action_btn.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';
import 'package:travel_trek/Features/plans/presentation/manger/cubit/get_all_plans_cubit.dart';
import 'package:travel_trek/Features/plans/presentation/views/widgets/plan_item.dart';
import 'package:travel_trek/core/services/prefs.dart';
import 'package:travel_trek/constants.dart';
import 'package:travel_trek/core/utils/app_colors.dart';

class BuildPlanItem extends StatefulWidget {
  const BuildPlanItem({super.key, required this.plan, required this.onTap});
  final PlanModel? plan;
  final VoidCallback onTap;

  @override
  State<BuildPlanItem> createState() => _BuildPlanItemState();
}

class _BuildPlanItemState extends State<BuildPlanItem> {
  bool showActions = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (showActions) {
          setState(() => showActions = false);
        } else {
          widget.onTap();
        }
      },
      onLongPress: () => setState(() => showActions = !showActions),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            PlanItem(planEntity: widget.plan!),
            if (showActions)
              BuildActionBtn(
                onDelete: () {
                  setState(() => showActions = false);
                  final planId = widget.plan?.value?.id;
                  if (planId == null) return;
                  final token = Prefs.getString(kUserToken);
                  BlocProvider.of<GetAllPlansCubit>(context).deletePlan(
                    token: token,
                    planId: planId,
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
