import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const String onboardingRoute = '/onboarding';

extension OnboardingNavigation on BuildContext {
  void navigateToOnboarding() => go(onboardingRoute);
}

extension OnboardingNavigationRouter on GoRouter {
  void navigateToOnboarding() => go(onboardingRoute);
}
