import 'package:flutter/material.dart';
import 'package:travel_trek/core/utils/app_colors.dart';
import 'package:travel_trek/core/utils/app_styles.dart';

class BuildHeaderWidget extends StatelessWidget {
  const BuildHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            const Text(
              'My Plans',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Text(
              'Sort by',
              style: AppStyles.caption.copyWith(
                fontSize: 14,
                color: Color(0xff6B6363),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Date ↓',
              style: AppStyles.labelSm.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}