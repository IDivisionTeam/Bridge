// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_response_session_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkResponseSessionId _$NetworkResponseSessionIdFromJson(
        Map<String, dynamic> json) =>
    NetworkResponseSessionId(
      json['session_id'] as String,
      json['success'] as bool,
    );

Map<String, dynamic> _$NetworkResponseSessionIdToJson(
        NetworkResponseSessionId instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
      'success': instance.success,
    };
