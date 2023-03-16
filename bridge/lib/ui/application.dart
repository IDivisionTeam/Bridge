import 'package:bridge/authentication/authentication_bloc.dart';
import 'package:bridge/ui/app_view.dart';
import 'package:core_data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<StatefulWidget> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
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
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: _authenticationRepository,
          userRepository: _userRepository,
          tokenRepository: _tokenRepository,
        ),
        child: AppView(),
      ),
    );
  }
}
