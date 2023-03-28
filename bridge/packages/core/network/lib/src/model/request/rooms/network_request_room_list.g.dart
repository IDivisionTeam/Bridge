// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_request_room_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkRequestRoomList _$NetworkRequestRoomListFromJson(
        Map<String, dynamic> json) =>
    NetworkRequestRoomList(
      json['open'] as bool,
      json['user_id'] as String,
      json['token'] as String,
    );

Map<String, dynamic> _$NetworkRequestRoomListToJson(
        NetworkRequestRoomList instance) =>
    <String, dynamic>{
      'open': instance.isOpen,
      'user_id': instance.userId,
      'token': instance.token,
    };
