import 'package:bridge/ui/app_view.dart';
import 'package:core_bloc/bloc.dart';
import 'package:core_data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Application extends StatelessWidget {
  const Application({
    super.key,
    required AuthenticationRepository authenticationRepository,
    required RoomRepository roomRepository,
    required UserRepository userRepository,
    required TokenRepository tokenRepository,
  })  : _authenticationRepository = authenticationRepository,
        _roomRepository = roomRepository,
        _userRepository = userRepository,
        _tokenRepository = tokenRepository;

  final AuthenticationRepository _authenticationRepository;
  final RoomRepository _roomRepository;
  final UserRepository _userRepository;
  final TokenRepository _tokenRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>.value(
          value: _authenticationRepository,
        ),
        RepositoryProvider<RoomRepository>.value(
          value: _roomRepository,
        ),
        RepositoryProvider<UserRepository>.value(
          value: _userRepository,
        ),
        RepositoryProvider<TokenRepository>.value(
          value: _tokenRepository,
        ),
      ],
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
