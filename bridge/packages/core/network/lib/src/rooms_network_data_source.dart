import 'package:core_network/src/api/rooms_api.dart';
import 'package:core_network/src/model/request/rooms/network_request_room.dart';
import 'package:core_network/src/model/request/rooms/network_request_room_create.dart';
import 'package:core_network/src/model/request/rooms/network_request_room_list.dart';
import 'package:core_network/src/model/response/network_response.dart';
import 'package:core_network/src/model/response/network_response_empty.dart';
import 'package:core_network/src/model/response/rooms/network_response_room.dart';
import 'package:core_network/src/model/response/rooms/network_response_room_id.dart';
import 'package:core_network/src/model/response/rooms/network_response_room_list.dart';
import 'package:core_network/src/util/error_extraction.dart';

class RoomsNetworkDataSource {
  final _api = RoomsApi();

  Future<NetworkResponse<String>> createRoom({
    required String hostId,
    required String userId,
    required String token,
  }) async {
    final requestBody = NetworkRequestRoomCreate(hostId, userId, token);
    return _api.createRoom(requestBody).then((response) {
      try {
        final roomId = NetworkResponseRoomId.fromJson(response).roomId;
        return NetworkResponse.success(roomId);
      } catch (_) {
        return extractError(response);
      }
    });
  }

  Future<NetworkResponse<bool>> deleteRoom({
    required String roomId,
    required String userId,
    required String token,
  }) async {
    final requestBody = NetworkRequestRoom(roomId, userId, token);
    return _api.deleteRoom(requestBody).then((response) {
      try {
        final success = NetworkResponseEmpty.fromJson(response).success;
        return NetworkResponse.success(success);
      } catch (_) {
        return extractError(response);
      }
    });
  }

  Future<NetworkResponse<bool>> joinRoom({
    required String roomId,
    required String userId,
    required String token,
  }) async {
    final requestBody = NetworkRequestRoom(roomId, userId, token);
    return _api.joinRoom(requestBody).then((response) {
      try {
        final success = NetworkResponseEmpty.fromJson(response).success;
        return NetworkResponse.success(success);
      } catch (_) {
        return extractError(response);
      }
    });
  }

  Future<NetworkResponse<List<NetworkRoom>>> listRooms({
    required bool isOpen,
    required String userId,
    required String token,
  }) async {
    final requestBody = NetworkRequestRoomList(isOpen, userId, token);
    return _api.listRooms(requestBody).then((response) {
      try {
        final roomList = NetworkResponseRoomList.fromJson(response).rooms;
        return NetworkResponse.success(roomList);
      } catch (_) {
        return extractError(response);
      }
    });
  }

  Future<NetworkResponse<NetworkRoom>> getRoom({
    required String roomId,
    required String userId,
    required String token,
  }) async {
    final requestBody = NetworkRequestRoom(roomId, userId, token);
    return _api.getRoom(requestBody).then((response) {
      try {
        final room = NetworkResponseRoom.fromJson(response).room;
        return NetworkResponse.success(room);
      } catch (_) {
        return extractError(response);
      }
    });
  }
}
