// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_request_session_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkRequestSessionCreate _$NetworkRequestSessionCreateFromJson(
        Map<String, dynamic> json) =>
    NetworkRequestSessionCreate(
      json['room_id'] as String,
      json['user_id'] as String,
      json['token'] as String,
    );

Map<String, dynamic> _$NetworkRequestSessionCreateToJson(
        NetworkRequestSessionCreate instance) =>
    <String, dynamic>{
      'room_id': instance.roomId,
      'user_id': instance.userId,
      'token': instance.token,
    };
