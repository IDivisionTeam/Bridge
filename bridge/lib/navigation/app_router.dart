import 'package:core_common/common.dart';
import 'package:feature_home/home.dart';
import 'package:feature_home/home.dart' as home;
import 'package:feature_lobby/lobby.dart' as lobby;
import 'package:feature_login/login.dart' as login;
import 'package:feature_onboarding/onboarding.dart' as onboarding;
import 'package:feature_room_list/room_list.dart' as roomList;
import 'package:feature_signup/signup.dart' as signup;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final String roomId = 'roomId';

  AppRouter() {
    _router = GoRouter(
      routes: [
        /* Entry Route */
        GoRoute(
          path: '/',
          builder: (_, __) =>
              Placeholder(), // TODO(splash): replace with progress screen.
        ),

        /* Main Routes */
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
            _homeRoute,
            _roomListRoute,
            _lobbyRoute,
          ],
        ),

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
        onNavHomeRequest: () => context.navigateToHome(),
      ),
    ),
  );

  final GoRoute _signUpRoute = GoRoute(
    path: signup.signUpRoute,
    pageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: signup.SignUpScreen(
        onNavBackClick: () => context.navigateToOnboarding(),
        onNavHomeRequest: () => context.navigateToHome(),
      ),
    ),
  );

  final GoRoute _homeRoute = GoRoute(
    path: home.homeRoute,
    pageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: home.HomeScreen(
        onNavAuthRequest: () => context.navigateToLogin(),
        onNavJoinGameRequest: () => context.navigateToRoomList(),
        onNavHostGameRequest: (roomId) => context.navigateToLobby(roomId),
      ),
    ),
  );

  final GoRoute _roomListRoute = GoRoute(
    path: roomList.roomListRoute,
    pageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: roomList.RoomListScreen(
        onNavJoinLobbyRequest: (roomId) => context.navigateToLobby(roomId),
      ),
    ),
  );

  final GoRoute _lobbyRoute = GoRoute(
    path: '${lobby.lobbyRoute}/:${lobby.lobbyRoomId}',
    name: lobby.lobbyName,
    pageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: lobby.LobbyScreen(
        roomId: state.params[lobby.lobbyRoomId].orEmpty(),
      ),
    ),
  );

  late final GoRouter _router;

  GoRouter get router => _router;
}
