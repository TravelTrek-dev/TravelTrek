import 'package:flutter/material.dart';
import 'package:travel_trek/Features/auth/presentation/views/sign_in_view.dart';
import 'package:travel_trek/constants.dart';
import 'package:travel_trek/core/services/prefs.dart';
import 'package:travel_trek/core/utils/app_images.dart';
import 'package:travel_trek/core/widgets/custom_button.dart';

class OnBoardingFinalPageView extends StatelessWidget {
  const OnBoardingFinalPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.imagesBackGroundOnBoarding),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Gradient Overlay
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: .3),
                Colors.black.withValues(alpha: .7),
              ],
            ),
          ),
        ),
        // Content
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // Logo/Icon Row
                Row(
                  children: [
                    Image.asset(Assets.imagesLogoIcon, height: 32),
                    const SizedBox(width: 8),
                    const Text(
                      'TravelTrek',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // Main Text
                const Text(
                  'Discover Your Next Adventure',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                const SizedBox(height: 16),
                const Text(
                  'One sentence. One perfect trip.\nPowered by AI.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 40),
                // Custom Button
                CustomButton(
                  text: 'GET STARTED',
                  onPressed: () {
                    Prefs.setBool(kIsOnBoardingSeen, true);
                   
                  },
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
