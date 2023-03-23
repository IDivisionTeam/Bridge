import 'package:bridge/navigation/app_router.dart';
import 'package:core_bloc/bloc.dart';
import 'package:core_data/data.dart';
import 'package:feature_home/home.dart';
import 'package:feature_onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppView extends StatelessWidget {
  AppView({
    super.key,
    required AuthenticationRepository authenticationRepository,
    required RoomRepository roomRepository,
    required UserRepository userRepository,
    required TokenRepository tokenRepository,
  }) : _appRouter = AppRouter(
          authenticationRepository,
          roomRepository,
          userRepository,
          tokenRepository,
        );

  final AppRouter _appRouter;

  @override
  Widget build(BuildContext context) {
    // TODO(theme): config theme.
    return MaterialApp.router(
      routerConfig: _appRouter.router,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _appRouter.router.navigateToHome();
                break;
              case AuthenticationStatus.unauthenticated:
                _appRouter.router.navigateToOnboarding();
                break;
              case AuthenticationStatus.unknown:
                break;
            }
          },
          child: child,
        );
      },
    );
  }
}
