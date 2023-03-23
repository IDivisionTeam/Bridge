part of 'lobby_bloc.dart';

abstract class LobbyEvent {
  const LobbyEvent();
}

class _LobbyRoomUpdated extends LobbyEvent {
  const _LobbyRoomUpdated(this.room);

  final Room? room;

  @override
  List<Object?> get props => [room];
}

class LobbyRoomFetched extends LobbyEvent {
  const LobbyRoomFetched(this.roomId);

  final String roomId;

  @override
  List<Object> get props => [roomId];
}

class LobbyRoomDeleted extends LobbyEvent {
  const LobbyRoomDeleted();
}
