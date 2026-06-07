import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:travel_trek/Features/auth/presentation/views/sign_in_view.dart';
import 'package:travel_trek/Features/home/presentation/views/main_view.dart';
import 'package:travel_trek/Features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:travel_trek/constants.dart';
import 'package:travel_trek/core/services/currency_location_service.dart';
import 'package:travel_trek/core/services/prefs.dart';
import 'package:travel_trek/core/utils/app_images.dart';
import 'package:travel_trek/core/utils/app_styles.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  var kRemeberMeSelectet = !Prefs.getBool(kSelectedRemeberMe);
  var isOnBoardingSeen = Prefs.getBool(kIsOnBoardingSeen);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeApp();
    });
  }

  Future<void> _initializeApp() async {
    debugPrint('[Splash] initialize app start');
    await Future.wait([
      _fetchAndSaveCurrency().timeout(
        const Duration(seconds: 10),
        onTimeout: () async {
          debugPrint('[Splash] currency fetch timed out; using SAR');
          await Prefs.setString(kSavedCurrency, 'SAR');
        },
      ),
      Future.delayed(const Duration(seconds: 3)),
    ]);

    if (!mounted) return;
    debugPrint('[Splash] navigate next');
    _navigateNext();
  }

  void _navigateNext() {
    if (isOnBoardingSeen) {
      if (kRemeberMeSelectet) {
        Navigator.pushReplacementNamed(context, MainView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, SignInView.routeName);
      }
    } else {
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Color(0xFFE3E3DA)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          const SizedBox(height: 100),
          Image.asset(Assets.imagesLogoIcon, height: 72, width: 64),
          Text(
            'TravelTrek',
            style: AppStyles.semiBold40.copyWith(color: Color(0xFF66595B)),
            textAlign: TextAlign.center,
          ),
          Text(
            'YOUR AI TRAVEL COMPANION',
            style: AppStyles.meduim14.copyWith(color: Color(0xFF66595B)),
            textAlign: TextAlign.center,
          ),
          Spacer(),
          DotsIndicator(
            dotsCount: 3,
            decorator: DotsDecorator(
              activeColor: Color(0xFF847577),
              colors: [
                Color(0XFF847577),
                Color(0XFF847577).withValues(alpha: 0.6),
                Color(0XFF847577).withValues(alpha: 0.3),
              ],
            ),
          ),

          const SizedBox(height: 16),
          Text(
            'Initializing journey...',
            style: AppStyles.regluar12.copyWith(color: Color(0xffA6A2A2)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 96),
        ],
      ),
    );
  }

  Future<void> _fetchAndSaveCurrency() async {
    try {
      final service = CurrencyLocationService();
      String currency = await service.getUserCurrency();

      debugPrint('======> Currency From Location Service: $currency');

      await Prefs.setString(kSavedCurrency, currency);
    } catch (e) {
      debugPrint('Error in fetchAndSaveCurrency: $e');
    }
  }
}
