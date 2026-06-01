import 'package:go_router/go_router.dart';
import 'package:travel_trek/Features/splash/presentation/views/splash_view.dart';

class AppRoute {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
    ],
  );
}
