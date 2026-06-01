import 'package:flutter/material.dart';
import 'package:travel_trek/Features/onboarding/presentation/views/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  static const routeName = 'OnboardingView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OnBoardingViewBody());
  }
}
