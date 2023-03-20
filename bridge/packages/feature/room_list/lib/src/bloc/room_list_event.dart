part of 'room_list_bloc.dart';

abstract class RoomListEvent extends Equatable {
  const RoomListEvent();

  @override
  List<Object> get props => [];
}

class RoomListFetch extends RoomListEvent {
  const RoomListFetch();
}
