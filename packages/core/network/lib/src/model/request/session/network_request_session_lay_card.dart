import 'package:core_common/common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_request_session_lay_card.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkRequestSessionLayCard implements Encodable {
  const NetworkRequestSessionLayCard(
    this.card,
    this.playerId,
    this.sessionId,
    this.userId,
    this.token,
  );

  final String card;
  final String playerId;
  final String sessionId;
  final String userId;
  final String token;

  factory NetworkRequestSessionLayCard.fromJson(Map<String, dynamic> json) =>
      _$NetworkRequestSessionLayCardFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkRequestSessionLayCardToJson(this);
}
