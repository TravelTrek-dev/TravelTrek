import 'package:flutter/material.dart';
import 'package:travel_trek/Features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const routeName = 'SplashView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashViewBody());
  }
}
