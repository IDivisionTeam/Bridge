// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_request_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkRequestRoom _$NetworkRequestRoomFromJson(Map<String, dynamic> json) =>
    NetworkRequestRoom(
      json['room_id'] as String,
      json['user_id'] as String,
      json['token'] as String,
    );

Map<String, dynamic> _$NetworkRequestRoomToJson(NetworkRequestRoom instance) =>
    <String, dynamic>{
      'room_id': instance.roomId,
      'user_id': instance.userId,
      'token': instance.token,
    };
