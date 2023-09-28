import 'package:core_data/data.dart';
import 'package:feature_lobby/src/lobby_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/lobby_bloc.dart';

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({
    super.key,
    String roomId = '',
  }) : _roomId = roomId;

  final String _roomId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LobbyBloc(
        roomRepository: context.read<RoomRepository>(),
        // sessionRepository: _sessionRepository,
        userRepository: context.read<UserRepository>(),
        tokenRepository: context.read<TokenRepository>(),
      )..add(LobbyRoomFetched(_roomId)),
      child: LobbyView(),
    );
  }
}
