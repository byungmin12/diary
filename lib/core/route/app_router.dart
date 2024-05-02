import 'package:diary/presentation/screen/onboarding/onboarding_screen.dart';
import 'package:diary/presentation/screen/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const Splash()),
    GoRoute(path: '/onboarding', builder: (context, state) => const OnBoarding())
  ],
);
