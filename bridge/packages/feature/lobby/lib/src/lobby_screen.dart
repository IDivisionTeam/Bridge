import 'package:core_data/data.dart';
import 'package:feature_lobby/src/lobby_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/lobby_bloc.dart';

class LobbyScreen extends StatefulWidget {
  const LobbyScreen({
    super.key,
    String roomId = '',
  }) : _roomId = roomId;

  final String _roomId;

  @override
  State<LobbyScreen> createState() => _LobbyState();
}

class _LobbyState extends State<LobbyScreen> {
  late final RoomRepository _roomRepository;

  // late final SessionRepository _sessionRepository;
  late final UserRepository _userRepository;
  late final TokenRepository _tokenRepository;

  @override
  void initState() {
    super.initState();
    _roomRepository = RoomRepository();
    // _sessionRepository = SessionRepository();
    _userRepository = UserRepository();
    _tokenRepository = TokenRepository();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<RoomRepository>(
          create: (context) => _roomRepository,
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => _userRepository,
        ),
        RepositoryProvider<TokenRepository>(
          create: (context) => _tokenRepository,
        ),
      ],
      child: BlocProvider(
        create: (_) => LobbyBloc(
          roomRepository: _roomRepository,
          // sessionRepository: _sessionRepository,
          userRepository: _userRepository,
          tokenRepository: _tokenRepository,
        )..add(FetchLobby(widget._roomId)),
        child: LobbyView(),
      ),
    );
  }

  @override
  void dispose() {
    _roomRepository.dispose();
    _userRepository.dispose();
    _tokenRepository.dispose();
    super.dispose();
  }
}
