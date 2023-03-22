import 'package:core_common/common.dart';
import 'package:core_network/src/api/rooms_api.dart';
import 'package:core_network/src/model/request/rooms/network_request_room.dart';
import 'package:core_network/src/model/request/rooms/network_request_room_create.dart';
import 'package:core_network/src/model/request/rooms/network_request_room_list.dart';
import 'package:core_network/src/model/response/network_response_empty.dart';
import 'package:core_network/src/model/response/rooms/network_response_room.dart';
import 'package:core_network/src/model/response/rooms/network_response_room_id.dart';
import 'package:core_network/src/model/response/rooms/network_response_room_list.dart';

class RoomsNetworkDataSource {
  final _api = RoomsApi();

  Future<Result<String>> createRoom({
    required String hostId,
    required String userId,
    required String token,
  }) async {
    final requestBody = NetworkRequestRoomCreate(hostId, userId, token);
    return _api.createRoom(requestBody).then((response) {
      if (response.hasError) return Result.failure(response.error!);

      final roomId = NetworkResponseRoomId.fromJson(response.data!).roomId;
      return Result.success(roomId);
    });
  }

  Future<Result<bool>> deleteRoom({
    required String roomId,
    required String userId,
    required String token,
  }) async {
    final requestBody = NetworkRequestRoom(roomId, userId, token);
    return _api.deleteRoom(requestBody).then((response) {
      if (response.hasError) return Result.failure(response.error!);

      final success = NetworkResponseEmpty.fromJson(response.data!).success;
      return Result.success(success);
    });
  }

  Future<Result<bool>> joinRoom({
    required String roomId,
    required String userId,
    required String token,
  }) async {
    final requestBody = NetworkRequestRoom(roomId, userId, token);
    return _api.joinRoom(requestBody).then((response) {
      if (response.hasError) return Result.failure(response.error!);

      final success = NetworkResponseEmpty.fromJson(response.data!).success;
      return Result.success(success);
    });
  }

  Future<Result<List<NetworkRoom>>> listRooms({
    required bool isOpen,
    required String userId,
    required String token,
  }) async {
    final requestBody = NetworkRequestRoomList(isOpen, userId, token);
    return _api.listRooms(requestBody).then((response) {
      if (response.hasError) return Result.failure(response.error!);

      final roomList = NetworkResponseRoomList.fromJson(response.data!).rooms;
      return Result.success(roomList);
    });
  }

  Future<Result<NetworkRoom>> getRoom({
    required String roomId,
    required String userId,
    required String token,
  }) async {
    final requestBody = NetworkRequestRoom(roomId, userId, token);
    return _api.getRoom(requestBody).then((response) {
      if (response.hasError) return Result.failure(response.error!);

      final roomList = NetworkResponseRoom.fromJson(response.data!).room;
      return Result.success(roomList);
    });
  }
}
