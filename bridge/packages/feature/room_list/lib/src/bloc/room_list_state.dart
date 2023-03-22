part of 'room_list_bloc.dart';

class RoomListState extends Equatable implements Copyable<RoomListState> {
  const RoomListState._({
    this.rooms = const [],
    this.roomIdToJoin = '',
  });

  final List<Room> rooms;
  final String roomIdToJoin;

  const RoomListState.initial() : this._();

  @override
  RoomListState copy({
    List<Room>? rooms,
    String? roomIdToJoin,
  }) {
    return RoomListState._(
      rooms: rooms ?? this.rooms,
      roomIdToJoin: roomIdToJoin ?? this.roomIdToJoin,
    );
  }

  @override
  List<Object> get props => [rooms, roomIdToJoin];
}
