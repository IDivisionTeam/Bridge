import 'package:core_common/common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_request_session_next_turn.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkRequestSessionNextTurn implements Encodable {
  const NetworkRequestSessionNextTurn(
    this.playerId,
    this.sessionId,
    this.userId,
    this.token,
  );

  final String playerId;
  final String sessionId;
  final String userId;
  final String token;

  factory NetworkRequestSessionNextTurn.fromJson(Map<String, dynamic> json) =>
      _$NetworkRequestSessionNextTurnFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkRequestSessionNextTurnToJson(this);
}
