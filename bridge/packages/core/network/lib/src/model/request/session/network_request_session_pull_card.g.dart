// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_request_session_pull_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkRequestSessionPullCard _$NetworkRequestSessionPullCardFromJson(
        Map<String, dynamic> json) =>
    NetworkRequestSessionPullCard(
      json['player_id'] as String,
      json['session_id'] as String,
      json['user_id'] as String,
      json['token'] as String,
    );

Map<String, dynamic> _$NetworkRequestSessionPullCardToJson(
        NetworkRequestSessionPullCard instance) =>
    <String, dynamic>{
      'player_id': instance.playerId,
      'session_id': instance.sessionId,
      'user_id': instance.userId,
      'token': instance.token,
    };
