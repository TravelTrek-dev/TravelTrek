import 'package:flutter/material.dart';
import 'package:travel_trek/Features/home/presentation/views/widgets/recent_plan_item.dart';
import 'package:travel_trek/core/utils/app_styles.dart';

class RecentPlanListViewBuilder extends StatelessWidget {
  const RecentPlanListViewBuilder({super.key, required this.prompts});
  final List<String> prompts;
  @override
  Widget build(BuildContext context) {



    if (prompts.isEmpty) {
      return Text(
        'No recent searches',
        style: AppStyles.regluar16.copyWith(color: const Color(0xff4A4646)),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: prompts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: RecentPlanItem(text: prompts[index]),
          );
        },
      ),
    );
  }
}
