import 'package:flutter/material.dart';
import 'package:travel_trek/Features/auth/presentation/views/forgot_password_view.dart';
import 'package:travel_trek/Features/auth/presentation/views/resend_verification_view.dart';
import 'package:travel_trek/Features/auth/presentation/views/sign_in_view.dart';
import 'package:travel_trek/Features/auth/presentation/views/sign_up_view.dart';
import 'package:travel_trek/Features/auth/presentation/views/trouble_signing_in_view.dart';
import 'package:travel_trek/Features/home/presentation/views/main_view.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/plan_view_details.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';
import 'package:travel_trek/Features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:travel_trek/Features/profile/presentation/views/profile_view.dart';
import 'package:travel_trek/Features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case MainView.routeName:
      return MaterialPageRoute(
        builder: (context) => const MainView(),
        settings: RouteSettings(arguments: setting.arguments),
      );
    case PlanViewDetails.routeName:
      final planModel = setting.arguments as PlanModel?;
      return MaterialPageRoute(
        builder: (context) => PlanViewDetails(planModel: planModel!,),
      );
    case ProfileView.routeName:
      return MaterialPageRoute(builder: (context) => const ProfileView());
    case TroubleSigningInView.routeName:
      return MaterialPageRoute(
          builder: (context) => const TroubleSigningInView());
    case ForgotPasswordView.routeName:
      return MaterialPageRoute(
          builder: (context) => const ForgotPasswordView());
    case ResendVerificationView.routeName:
      return MaterialPageRoute(
          builder: (context) => const ResendVerificationView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
