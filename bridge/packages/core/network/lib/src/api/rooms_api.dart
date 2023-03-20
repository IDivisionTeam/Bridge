import 'package:core_network/src/api/api_mixin.dart';
import 'package:core_network/src/model/request/rooms/network_request_room.dart';
import 'package:core_network/src/model/request/rooms/network_request_room_create.dart';
import 'package:core_network/src/model/request/rooms/network_request_room_list.dart';

class RoomsApi with ApiMixin {
  Future<Map<String, dynamic>> createRoom(
          NetworkRequestRoomCreate body) async =>
      post(to: 'room/create', encodable: body);

  Future<Map<String, dynamic>> deleteRoom(NetworkRequestRoom body) async =>
      post(to: 'room/delete', encodable: body);

  Future<Map<String, dynamic>> joinRoom(NetworkRequestRoom body) async =>
      post(to: 'room/join', encodable: body);

  Future<Map<String, dynamic>> listRooms(NetworkRequestRoomList body) async =>
      post(to: 'room/list', encodable: body);

  Future<Map<String, dynamic>> getRoom(NetworkRequestRoom body) async => get(
        from: 'room/${body.roomId}',
        parameters: withIdentity(
          userId: body.userId,
          token: body.token,
        ),
      );
}
