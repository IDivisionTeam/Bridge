import 'package:json_annotation/json_annotation.dart';

part 'network_response_room_id.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkResponseRoomId {
  const NetworkResponseRoomId(this.roomId, this.success);

  final String roomId;
  final bool success;

  factory NetworkResponseRoomId.fromJson(Map<String, dynamic> json) =>
      _$NetworkResponseRoomIdFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkResponseRoomIdToJson(this);
}
