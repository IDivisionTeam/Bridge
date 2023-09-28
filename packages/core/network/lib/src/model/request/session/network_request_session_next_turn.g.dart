// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_request_session_next_turn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkRequestSessionNextTurn _$NetworkRequestSessionNextTurnFromJson(
        Map<String, dynamic> json) =>
    NetworkRequestSessionNextTurn(
      json['player_id'] as String,
      json['session_id'] as String,
      json['user_id'] as String,
      json['token'] as String,
    );

Map<String, dynamic> _$NetworkRequestSessionNextTurnToJson(
        NetworkRequestSessionNextTurn instance) =>
    <String, dynamic>{
      'player_id': instance.playerId,
      'session_id': instance.sessionId,
      'user_id': instance.userId,
      'token': instance.token,
    };
