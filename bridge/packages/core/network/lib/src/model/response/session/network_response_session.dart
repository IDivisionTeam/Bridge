import 'package:json_annotation/json_annotation.dart';

part 'network_response_session.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class NetworkResponseSession {
  const NetworkResponseSession(this.session, this.success);

  final NetworkSession session;
  final bool success;

  factory NetworkResponseSession.fromJson(Map<String, dynamic> json) =>
      _$NetworkResponseSessionFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkResponseSessionToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class NetworkSession {
  const NetworkSession(
    this.id,
    this.currentPlayer,
    this.deck,
    this.players,
    this.table,
  );

  final String id;
  final NetworkCurrentPlayer currentPlayer;
  final List<String> deck;
  final List<String> players;
  final List<String> table;

  factory NetworkSession.fromJson(Map<String, dynamic> json) =>
      _$NetworkSessionFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkSessionToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkCurrentPlayer {
  const NetworkCurrentPlayer(
    this.id,
    this.sessionId,
    this.cards,
    this.name,
    this.state,
  );

  final String id;
  final String sessionId;
  final List<String> cards;
  final String name;
  final String state;

  factory NetworkCurrentPlayer.fromJson(Map<String, dynamic> json) =>
      _$NetworkCurrentPlayerFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkCurrentPlayerToJson(this);
}
