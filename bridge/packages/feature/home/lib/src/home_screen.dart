import 'package:core_bloc/bloc.dart';
import 'package:core_data/data.dart';
import 'package:feature_home/src/bloc/home_bloc.dart';
import 'package:feature_home/src/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
    required this.onNavAuthRequest,
    required this.onNavJoinGameRequest,
  });

  final VoidCallback? onNavAuthRequest;
  final VoidCallback? onNavJoinGameRequest;

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final AuthenticationRepository _authenticationRepository;
  late final UserRepository _userRepository;
  late final TokenRepository _tokenRepository;

  @override
  void initState() {
    super.initState();
    _authenticationRepository = AuthenticationRepository();
    _userRepository = UserRepository();
    _tokenRepository = TokenRepository();
  }

  @override
  void dispose() {
    _authenticationRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>(
            create: (context) => _authenticationRepository),
        RepositoryProvider<UserRepository>(
            create: (context) => _userRepository),
        RepositoryProvider<TokenRepository>(
            create: (context) => _tokenRepository),
      ],
      child: MultiBlocProvider(
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
        child: HomeView(
          onNavAuthRequest: widget.onNavAuthRequest,
          onNavJoinGameRequest: widget.onNavJoinGameRequest,
        ),
      ),
    );
  }
}
