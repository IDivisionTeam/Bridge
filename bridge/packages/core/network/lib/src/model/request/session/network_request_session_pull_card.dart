import 'package:core_common/common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_request_session_pull_card.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkRequestSessionPullCard implements Encodable {
  const NetworkRequestSessionPullCard(
    this.playerId,
    this.sessionId,
    this.userId,
    this.token,
  );

  final String playerId;
  final String sessionId;
  final String userId;
  final String token;

  factory NetworkRequestSessionPullCard.fromJson(Map<String, dynamic> json) =>
      _$NetworkRequestSessionPullCardFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkRequestSessionPullCardToJson(this);
}
