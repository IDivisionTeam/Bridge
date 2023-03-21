import 'package:core_common/common.dart';
import 'package:core_model/model.dart';
import 'package:core_network/network.dart';

class RoomRepository implements Disposable {
  final _networkSource = RoomsNetworkDataSource();

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
        .then((value) => value.data);
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
        .then((value) => value.data);
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
        .then((value) => value.data);
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
        .then((value) {
      final data = value.data;
      if (data == null) return List.empty();

      return data.map((room) {
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
        .then((value) {
      final room = value.data;
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
  void dispose() {
    // TODO(room-list): handle getRoom dispose as Stream.
  }
}
