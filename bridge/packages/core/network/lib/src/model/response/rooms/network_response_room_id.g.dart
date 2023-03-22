// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_response_room_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkResponseRoomId _$NetworkResponseRoomIdFromJson(
        Map<String, dynamic> json) =>
    NetworkResponseRoomId(
      json['room_id'] as String,
      json['success'] as bool,
    );

Map<String, dynamic> _$NetworkResponseRoomIdToJson(
        NetworkResponseRoomId instance) =>
    <String, dynamic>{
      'room_id': instance.roomId,
      'success': instance.success,
    };
