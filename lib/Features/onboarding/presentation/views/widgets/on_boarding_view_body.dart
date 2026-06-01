import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:travel_trek/Features/onboarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:travel_trek/core/utils/app_colors.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OnBoardingPageView(pageController: pageController),
        Visibility(
          visible: currentPage == 0,
          child: Positioned(
            right: 0,
            left: 0,
            top: 0,
            bottom: -600,
            child: DotsIndicator(
              dotsCount: 1,
              decorator: DotsDecorator(activeColor: AppColors.primaryColor),
            ),
          ),
        ),

        const SizedBox(height: 60),
      ],
    );
  }
}
