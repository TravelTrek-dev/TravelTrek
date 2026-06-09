import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/splash/presentation/views/splash_view.dart';
import 'package:travel_trek/constants.dart';
import 'package:travel_trek/core/helper_function/on_generate_route.dart';
import 'package:travel_trek/core/services/prefs.dart';
import 'package:travel_trek/core/services/service_locator.dart';
import 'package:travel_trek/core/services/simple_bloc_observer.dart';
import 'package:travel_trek/core/utils/app_colors.dart';
import 'package:travel_trek/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setup();
  await Prefs.init();
  final localCurrency = Prefs.getString(kSavedCurrency);
  log('Saved Local Currency: $localCurrency'); 

  runApp(const TravelTrek());
}

class TravelTrek extends StatelessWidget {
  const TravelTrek({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
    );
  }
}
