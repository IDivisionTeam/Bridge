import 'package:core_bloc/bloc.dart';
import 'package:core_data/data.dart';
import 'package:feature_home/src/bloc/home_bloc.dart';
import 'package:feature_home/src/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.onNavAuthRequest,
  });

  final VoidCallback? onNavAuthRequest;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            authenticationRepository:
                RepositoryProvider.of<AuthenticationRepository>(context),
            userRepository: RepositoryProvider.of<UserRepository>(context),
            tokenRepository: RepositoryProvider.of<TokenRepository>(context),
          ),
        ),
      ],
      child: HomeView(onNavAuthRequest: onNavAuthRequest),
    );
  }
}
