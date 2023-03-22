import 'package:core_common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const String lobbyRoute = '/lobby';
const String lobbyName = 'lobby';
const String lobbyRoomId = 'roomId';

extension LobbyNavigation on BuildContext {
  void navigateToLobby(String? roomId) => pushNamed(
        lobbyName,
        params: {
          lobbyRoomId: roomId.orEmpty(),
        },
      );
}

extension LobbyNavigationRouter on GoRouter {
  void navigateToLobby() => push(lobbyRoute);
}
