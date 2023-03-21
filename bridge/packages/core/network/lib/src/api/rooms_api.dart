import 'package:core_network/src/api/api_mixin.dart';
import 'package:core_network/src/model/request/rooms/network_request_room.dart';
import 'package:core_network/src/model/request/rooms/network_request_room_create.dart';
import 'package:core_network/src/model/request/rooms/network_request_room_list.dart';
import 'package:core_network/src/model/response/network_response.dart';

class RoomsApi with ApiMixin {
  Future<NetworkResponse> createRoom(NetworkRequestRoomCreate body) async =>
      post(to: 'room/create', encodable: body);

  Future<NetworkResponse> deleteRoom(NetworkRequestRoom body) async =>
      post(to: 'room/delete', encodable: body);

  Future<NetworkResponse> joinRoom(NetworkRequestRoom body) async =>
      post(to: 'room/join', encodable: body);

  Future<NetworkResponse> listRooms(NetworkRequestRoomList body) async =>
      post(to: 'room/list', encodable: body);

  Future<NetworkResponse> getRoom(NetworkRequestRoom body) async => get(
        from: 'room/${body.roomId}',
        parameters: withIdentity(
          userId: body.userId,
          token: body.token,
        ),
      );
}
