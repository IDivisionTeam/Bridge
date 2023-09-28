import 'package:core_network/src/model/response/rooms/network_response_room.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_response_room_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class NetworkResponseRoomList {
  const NetworkResponseRoomList(this.rooms, this.success);

  final List<NetworkRoom> rooms;
  final bool success;

  factory NetworkResponseRoomList.fromJson(Map<String, dynamic> json) =>
      _$NetworkResponseRoomListFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkResponseRoomListToJson(this);
}
