import 'package:core_common/common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_request_room.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkRequestRoom implements Encodable {
  const NetworkRequestRoom(
    this.roomId,
    this.userId,
    this.token,
  );

  final String roomId;
  final String userId;
  final String token;

  factory NetworkRequestRoom.fromJson(Map<String, dynamic> json) =>
      _$NetworkRequestRoomFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkRequestRoomToJson(this);
}
