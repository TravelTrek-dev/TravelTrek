import 'package:flutter/material.dart';
import 'package:travel_trek/Features/onboarding/presentation/views/widgets/card_info.dart';
import 'package:travel_trek/core/utils/app_colors.dart';
import 'package:travel_trek/core/utils/app_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 80),
        Text(
          'How It Works',
          style: AppStyles.regluar32.copyWith(color: AppColors.primaryColor),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Text(
          'Discover your next adventure with\n TravelTrek',
          style: AppStyles.italic16.copyWith(color: Color(0xffA6908F)),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 40),

        CardInfo(
          iconData: Icons.mic_none_outlined,
          title: 'Describe Your Trip',
          description: 'Just type or speak your travel goal naturally',
        ),
        const SizedBox(height: 12),
        CardInfo(
          iconData: Icons.memory_outlined,
          title: 'AI Analyzes Everything',
          description:
              'Our AI extracts destinations, dates, budget, and preferences',
        ),
        const SizedBox(height: 12),
        CardInfo(
          iconData: Icons.map_outlined,
          title: 'Get Your Perfect Plan',
          description: 'Receive a complete,personalized itinerary in seconds',
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
