import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const String homeRoute = '/home';

extension HomeNavigation on BuildContext {
  void navigateToHome() => go(homeRoute);
}

extension HomeNavigationRouter on GoRouter {
  void navigateToHome() => go(homeRoute);
}
