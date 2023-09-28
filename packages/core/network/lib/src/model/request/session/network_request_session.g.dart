// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_request_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkRequestSession _$NetworkRequestSessionFromJson(
        Map<String, dynamic> json) =>
    NetworkRequestSession(
      json['session_id'] as String,
      json['user_id'] as String,
      json['token'] as String,
    );

Map<String, dynamic> _$NetworkRequestSessionToJson(
        NetworkRequestSession instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
      'user_id': instance.userId,
      'token': instance.token,
    };
