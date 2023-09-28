import 'package:core_common/common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_request_room_create.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkRequestRoomCreate implements Encodable {
  const NetworkRequestRoomCreate(this.hostId, this.userId, this.token);

  /// Same as userId, required by BE.
  final String hostId;
  final String userId;
  final String token;

  factory NetworkRequestRoomCreate.fromJson(Map<String, dynamic> json) =>
      _$NetworkRequestRoomCreateFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkRequestRoomCreateToJson(this);
}
