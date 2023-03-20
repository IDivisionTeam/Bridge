import 'package:json_annotation/json_annotation.dart';

part 'network_response_room.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class NetworkResponseRoom {
  const NetworkResponseRoom(this.room, this.success);

  final NetworkRoom room;
  final bool success;

  factory NetworkResponseRoom.fromJson(Map<String, dynamic> json) =>
      _$NetworkResponseRoomFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkResponseRoomToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class NetworkRoom {
  const NetworkRoom(
    this.id,
    this.host,
    this.users,
    this.isOpen,
  );

  final String id;
  final NetworkUser host;
  final List<NetworkUser> users;
  @JsonKey(name: 'open')
  final bool isOpen;

  factory NetworkRoom.fromJson(Map<String, dynamic> json) =>
      _$NetworkRoomFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkRoomToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkUser {
  const NetworkUser(this.id, this.nickname);

  final String id;
  final String nickname;

  factory NetworkUser.fromJson(Map<String, dynamic> json) =>
      _$NetworkUserFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkUserToJson(this);
}
