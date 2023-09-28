import 'package:core_common/common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_request_session_close.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkRequestSessionClose implements Encodable {
  const NetworkRequestSessionClose(
    this.sessionId,
    this.userId,
    this.token,
  );

  final String sessionId;
  final String userId;
  final String token;

  factory NetworkRequestSessionClose.fromJson(Map<String, dynamic> json) =>
      _$NetworkRequestSessionCloseFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkRequestSessionCloseToJson(this);
}
