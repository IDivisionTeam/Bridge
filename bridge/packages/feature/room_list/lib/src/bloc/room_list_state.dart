part of 'room_list_bloc.dart';

class RoomListState extends Equatable implements Copyable<RoomListState> {
  const RoomListState._({this.rooms = const []});

  final List<Room> rooms;

  const RoomListState.initial() : this._();

  @override
  RoomListState copy({List<Room>? rooms}) {
    return RoomListState._(rooms: rooms ?? this.rooms);
  }

  @override
  List<Object> get props => [rooms];
}
