import 'package:flutter/material.dart';
import 'package:travel_trek/Features/onboarding/presentation/views/widgets/on_barding_final_page_view.dart';
import 'package:travel_trek/Features/onboarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [PageViewItem(), OnBoardingFinalPageView()],
    );
  }
}
