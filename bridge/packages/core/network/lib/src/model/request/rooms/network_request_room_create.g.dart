// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_request_room_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkRequestRoomCreate _$NetworkRequestRoomCreateFromJson(
        Map<String, dynamic> json) =>
    NetworkRequestRoomCreate(
      json['host_id'] as String,
      json['user_id'] as String,
      json['token'] as String,
    );

Map<String, dynamic> _$NetworkRequestRoomCreateToJson(
        NetworkRequestRoomCreate instance) =>
    <String, dynamic>{
      'host_id': instance.hostId,
      'user_id': instance.userId,
      'token': instance.token,
    };
