import 'package:flutter/material.dart';
import 'package:travel_trek/Features/home/presentation/views/widgets/recent_plan_item.dart';
import 'package:travel_trek/constants.dart';
import 'package:travel_trek/core/utils/app_styles.dart';

class RecentPlanListViewBuilder extends StatelessWidget {
  const RecentPlanListViewBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    if (kRecentSearches.isEmpty) {
      return Text(
        'No recent searches',
        style: AppStyles.regluar16.copyWith(
          color: const Color(0xff4A4646),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: kRecentSearches.length,
        itemBuilder: (context, index) {
          return RecentPlanItem(text: kRecentSearches[index]);
        },
      ),
    );
  }
}