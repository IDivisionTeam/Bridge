import 'package:core_common/common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_request_session_create.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkRequestSessionCreate implements Encodable {
  const NetworkRequestSessionCreate(
    this.roomId,
    this.userId,
    this.token,
  );

  final String roomId;
  final String userId;
  final String token;

  factory NetworkRequestSessionCreate.fromJson(Map<String, dynamic> json) =>
      _$NetworkRequestSessionCreateFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkRequestSessionCreateToJson(this);
}
