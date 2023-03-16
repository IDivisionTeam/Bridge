import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login/login.dart' as login;
import 'package:onboarding/onboarding.dart' as onboarding;
import 'package:signup/signup.dart' as signup;

class AppRouter {
  AppRouter() {
    _router = GoRouter(
      routes: [
        /* Entry Route */
        GoRoute(
          path: '/',
          builder: (_, __) => Placeholder(), // TODO(home): replace with progress screen.
        ),

        /* Main Routes */
        // TODO(home): add main routes

        /* Auth Routes */
        ShellRoute(
            builder: (context, state, child) {
              return MaterialApp(
                theme: ThemeData(
                  // TODO(theme): config theme.
                  primarySwatch: Colors.yellow,
                ),
                home: Scaffold(
                  body: SafeArea(
                    child: child,
                  ),
                ),
              );
            },
            routes: [
              _onboardingRoute,
              _loginRoute,
              _signUpRoute,
            ]),
      ],
    );
  }

  final GoRoute _onboardingRoute = GoRoute(
    path: onboarding.onboardingRoute,
    pageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: onboarding.OnboardingScreen(
        onLoginNavClick: () => context.navigateToLogin(),
        onSignUpNavClick: () => context.navigateToSignUp(),
      ),
    ),
  );

  final GoRoute _loginRoute = GoRoute(
    path: login.loginRoute,
    pageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: login.LoginScreen(
        onNavBackClick: () => context.navigateToOnboarding(),
      ),
    ),
  );

  final GoRoute _signUpRoute = GoRoute(
    path: signup.signUpRoute,
    pageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: signup.SignUpScreen(
        onNavBackClick: () => context.navigateToOnboarding(),
      ),
    ),
  );

  late final GoRouter _router;

  GoRouter get router => _router;
}
