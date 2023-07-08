import 'package:core_common/common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_request_session.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkRequestSession implements Encodable {
  const NetworkRequestSession(
    this.sessionId,
    this.userId,
    this.token,
  );

  final String sessionId;
  final String userId;
  final String token;

  factory NetworkRequestSession.fromJson(Map<String, dynamic> json) =>
      _$NetworkRequestSessionFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkRequestSessionToJson(this);
}
