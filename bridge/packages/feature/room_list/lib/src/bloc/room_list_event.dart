part of 'room_list_bloc.dart';

abstract class RoomListEvent extends Equatable {
  const RoomListEvent();

  @override
  List<Object> get props => [];
}

class RoomListFetch extends RoomListEvent {
  const RoomListFetch();
}

class CleanLobbyId extends RoomListEvent {
  const CleanLobbyId();
}

class JoinLobby extends RoomListEvent {
  const JoinLobby(this.roomId);

  final String roomId;

  @override
  List<Object> get props => [roomId];
}
