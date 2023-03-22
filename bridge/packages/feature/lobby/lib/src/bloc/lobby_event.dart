part of 'lobby_bloc.dart';

abstract class LobbyEvent {
  const LobbyEvent();
}

class _LobbyStatusChanged extends LobbyEvent {
  const _LobbyStatusChanged(this.room);

  final Room? room;

  @override
  List<Object?> get props => [room];
}

class FetchLobby extends LobbyEvent {
  const FetchLobby(this.roomId);

  final String roomId;

  @override
  List<Object> get props => [roomId];
}

class DeleteLobby extends LobbyEvent {
  const DeleteLobby();
}
