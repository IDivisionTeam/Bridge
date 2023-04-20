// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_response_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkResponseSession _$NetworkResponseSessionFromJson(
        Map<String, dynamic> json) =>
    NetworkResponseSession(
      NetworkSession.fromJson(json['session'] as Map<String, dynamic>),
      json['success'] as bool,
    );

Map<String, dynamic> _$NetworkResponseSessionToJson(
        NetworkResponseSession instance) =>
    <String, dynamic>{
      'session': instance.session.toJson(),
      'success': instance.success,
    };

NetworkSession _$NetworkSessionFromJson(Map<String, dynamic> json) =>
    NetworkSession(
      json['id'] as String,
      NetworkCurrentPlayer.fromJson(
          json['current_player'] as Map<String, dynamic>),
      (json['deck'] as List<dynamic>).map((e) => e as String).toList(),
      (json['players'] as List<dynamic>).map((e) => e as String).toList(),
      (json['table'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$NetworkSessionToJson(NetworkSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'current_player': instance.currentPlayer.toJson(),
      'deck': instance.deck,
      'players': instance.players,
      'table': instance.table,
    };

NetworkCurrentPlayer _$NetworkCurrentPlayerFromJson(
        Map<String, dynamic> json) =>
    NetworkCurrentPlayer(
      json['id'] as String,
      json['session_id'] as String,
      (json['cards'] as List<dynamic>).map((e) => e as String).toList(),
      json['name'] as String,
      json['state'] as String,
    );

Map<String, dynamic> _$NetworkCurrentPlayerToJson(
        NetworkCurrentPlayer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'session_id': instance.sessionId,
      'cards': instance.cards,
      'name': instance.name,
      'state': instance.state,
    };
