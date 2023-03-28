part of 'room_list_bloc.dart';

abstract class RoomListEvent extends Equatable {
  const RoomListEvent();

  @override
  List<Object> get props => [];
}

class RoomListFetched extends RoomListEvent {
  const RoomListFetched();
}

class RoomIdCleaned extends RoomListEvent {
  const RoomIdCleaned();
}

class RoomUserJoined extends RoomListEvent {
  const RoomUserJoined(this.roomId);

  final String roomId;

  @override
  List<Object> get props => [roomId];
}
