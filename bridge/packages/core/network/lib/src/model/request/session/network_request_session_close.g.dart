// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_request_session_close.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkRequestSessionClose _$NetworkRequestSessionCloseFromJson(
        Map<String, dynamic> json) =>
    NetworkRequestSessionClose(
      json['session_id'] as String,
      json['user_id'] as String,
      json['token'] as String,
    );

Map<String, dynamic> _$NetworkRequestSessionCloseToJson(
        NetworkRequestSessionClose instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
      'user_id': instance.userId,
      'token': instance.token,
    };
