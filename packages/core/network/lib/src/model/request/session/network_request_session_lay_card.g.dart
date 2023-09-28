// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_request_session_lay_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkRequestSessionLayCard _$NetworkRequestSessionLayCardFromJson(
        Map<String, dynamic> json) =>
    NetworkRequestSessionLayCard(
      json['card'] as String,
      json['player_id'] as String,
      json['session_id'] as String,
      json['user_id'] as String,
      json['token'] as String,
    );

Map<String, dynamic> _$NetworkRequestSessionLayCardToJson(
        NetworkRequestSessionLayCard instance) =>
    <String, dynamic>{
      'card': instance.card,
      'player_id': instance.playerId,
      'session_id': instance.sessionId,
      'user_id': instance.userId,
      'token': instance.token,
    };
