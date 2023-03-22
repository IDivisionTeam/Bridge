import 'dart:async';

import 'package:core_common/common.dart';
import 'package:core_model/model.dart';
import 'package:core_network/network.dart';

class RoomRepository implements Disposable {
  final _controller = StreamController<Room>();
  final _networkSource = RoomsNetworkDataSource();

  Stream<Room?> getRoomStream(
      String roomId, String token, String userId) async* {
    while (true) {
      yield await getRoom(roomId: roomId, token: token, userId: userId);
      await Future<void>.delayed(const Duration(seconds: 1));
    }
  }

  Future<String?> createRoom({
    required String token,
    required String userId,
  }) async {
    return _networkSource
        .createRoom(
          hostId: userId,
          userId: userId,
          token: token,
        )
        .then((result) => result.getOrNull());
  }

  Future<bool?> deleteRoom({
    required String roomId,
    required String token,
    required String userId,
  }) async {
    return _networkSource
        .deleteRoom(
          roomId: roomId,
          userId: userId,
          token: token,
        )
        .then((result) => result.getOrNull());
  }

  Future<bool?> joinRoom({
    required String roomId,
    required String token,
    required String userId,
  }) async {
    return _networkSource
        .joinRoom(
          roomId: roomId,
          userId: userId,
          token: token,
        )
        .then((result) => result.getOrNull());
  }

  Future<List<Room>> listRooms({
    required String token,
    required String userId,
    bool isOpen = true,
  }) async {
    return _networkSource
        .listRooms(
      isOpen: isOpen,
      userId: userId,
      token: token,
    )
        .then((result) {
      final roomList = result.getOrDefault(List.empty());

      return roomList.map((room) {
        return Room(
          id: room.id,
          host: RoomUser(
            id: room.host.id,
            nickname: room.host.nickname,
          ),
          users: room.users.map((roomUser) {
            return RoomUser(
              id: roomUser.id,
              nickname: roomUser.nickname,
            );
          }).toList(),
          isOpen: room.isOpen,
        );
      }).toList();
    });
  }

  Future<Room?> getRoom({
    required String roomId,
    required String token,
    required String userId,
  }) async {
    return _networkSource
        .getRoom(
      roomId: roomId,
      userId: userId,
      token: token,
    )
        .then((result) {
      final room = result.getOrNull();
      if (room == null) return null;

      return Room(
        id: room.id,
        host: RoomUser(
          id: room.host.id,
          nickname: room.host.nickname,
        ),
        users: room.users.map((roomUser) {
          return RoomUser(
            id: roomUser.id,
            nickname: roomUser.nickname,
          );
        }).toList(),
        isOpen: room.isOpen,
      );
    });
  }

  @override
  void dispose() => _controller.close();
}
