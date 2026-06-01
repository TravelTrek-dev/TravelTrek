import 'package:flutter/material.dart';
import 'package:travel_trek/Features/plans/presentation/domain/entities/plan_entity.dart';
import 'package:travel_trek/core/utils/app_colors.dart';
import 'package:travel_trek/core/utils/app_styles.dart';

class PlanItem extends StatelessWidget {
  const PlanItem({super.key, required this.planEntity});
  final PlanEntity planEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryColor.withValues(alpha: 0.7),
                  AppColors.primaryColor.withValues(alpha: 0.4),
                ],
              ),
            ),
            child:  Image.asset(planEntity.imageAsset! , fit: BoxFit.fill,)
          ),
        ),
        const SizedBox(width: 14),
        // Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      planEntity.title,
                      style: AppStyles.headlineSm,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 12,
                    color: AppColors.textMuted,
                  ),
                  const SizedBox(width: 2),
                  Expanded(
                    child: Text(
                      planEntity.location,
                      style: AppStyles.caption,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 11,
                    color: AppColors.textMuted,
                  ),
                  const SizedBox(width: 4),
                  Text(planEntity.dateRange, style: AppStyles.caption),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDE7D9),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      '${planEntity.daysCount} Days',
                      style: AppStyles.caption.copyWith(fontSize: 10),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}