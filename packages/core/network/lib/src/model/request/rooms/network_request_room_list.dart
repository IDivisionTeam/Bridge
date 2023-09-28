import 'package:core_common/common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_request_room_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkRequestRoomList implements Encodable {
  const NetworkRequestRoomList(
    this.isOpen,
    this.userId,
    this.token,
  );

  @JsonKey(name: 'open')
  final bool isOpen;
  final String userId;
  final String token;

  factory NetworkRequestRoomList.fromJson(Map<String, dynamic> json) =>
      _$NetworkRequestRoomListFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkRequestRoomListToJson(this);
}
