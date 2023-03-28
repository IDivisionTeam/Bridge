import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const String loginRoute = '/login';

extension LoginNavigation on BuildContext {
  void navigateToLogin() => go(loginRoute);
}

extension LoginNavigationRouter on GoRouter {
  void navigateToLogin() => go(loginRoute);
}
