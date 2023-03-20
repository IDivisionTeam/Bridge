import 'package:core_datastore/datastore.dart';
import 'package:core_model/model.dart';
import 'package:core_common/common.dart';
import 'package:core_network/network.dart';

class RoomRepository implements Disposable {
  final _networkSource = RoomsNetworkDataSource();
  final _tokenLocalSource = TokenLocalDataSource();
  final _userLocalSource = UserLocalDataSource();

  late final String? _token;
  late final User? _user;

  Future<String?> _getToken() async {
    if (_token != null) return _token;

    _token = await _tokenLocalSource.getToken();
    return _token;
  }

  Future<User?> _getUser() async {
    if (_user != null) return _user;

    _user = await _userLocalSource.getUser();
    return _user;
  }

  Future<String?> createRoom() async {
    final token = await _getToken();
    final user = await _getUser();

    if (user == null || token == null) return null;

    return _networkSource
        .createRoom(
          hostId: user.id,
          userId: user.id,
          token: token,
        )
        .then((value) => value.data);
  }

  Future<bool?> deleteRoom({
    required String roomId,
  }) async {
    final token = await _getToken();
    final user = await _getUser();

    if (user == null || token == null) return null;

    return _networkSource
        .deleteRoom(
          roomId: roomId,
          userId: user.id,
          token: token,
        )
        .then((value) => value.data);
  }

  Future<bool?> joinRoom({
    required String roomId,
  }) async {
    final token = await _getToken();
    final user = await _getUser();

    if (user == null || token == null) return null;

    return _networkSource
        .joinRoom(
          roomId: roomId,
          userId: user.id,
          token: token,
        )
        .then((value) => value.data);
  }

  Future<List<Room>> listRooms({
    bool isOpen = true,
  }) async {
    final token = await _getToken();
    final user = await _getUser();

    if (user == null || token == null) return List.empty();

    return _networkSource
        .listRooms(
      isOpen: isOpen,
      userId: user.id,
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
  }) async {
    final token = await _getToken();
    final user = await _getUser();

    if (user == null || token == null) return null;

    return _networkSource
        .getRoom(
      roomId: roomId,
      userId: user.id,
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
    this._token = null;
    this._user = null;
  }
}
