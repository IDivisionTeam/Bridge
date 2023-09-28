import 'package:json_annotation/json_annotation.dart';

part 'network_response_session_id.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkResponseSessionId {
  const NetworkResponseSessionId(this.sessionId, this.success);

  final String sessionId;
  final bool success;

  factory NetworkResponseSessionId.fromJson(Map<String, dynamic> json) =>
      _$NetworkResponseSessionIdFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkResponseSessionIdToJson(this);
}
