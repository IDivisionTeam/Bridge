import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const String signUpRoute = '/signup';

extension SignUpNavigation on BuildContext {
  void navigateToSignUp() => go(signUpRoute);
}

extension SignUpNavigationRouter on GoRouter {
  void navigateToSignUp() => go(signUpRoute);
}
