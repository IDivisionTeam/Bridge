import 'package:core_data/data.dart';
import 'package:feature_lobby/src/lobby_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/lobby_bloc.dart';

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({
    super.key,
    required RoomRepository roomRepository,
    required UserRepository userRepository,
    required TokenRepository tokenRepository,
    String roomId = '',
  })  : _roomId = roomId,
        _roomRepository = roomRepository,
        _userRepository = userRepository,
        _tokenRepository = tokenRepository;

  final String _roomId;

  //  final SessionRepository _sessionRepository;
  final RoomRepository _roomRepository;
  final UserRepository _userRepository;
  final TokenRepository _tokenRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LobbyBloc(
        roomRepository: _roomRepository,
        // sessionRepository: _sessionRepository,
        userRepository: _userRepository,
        tokenRepository: _tokenRepository,
      )..add(LobbyRoomFetched(_roomId)),
      child: LobbyView(),
    );
  }
}
