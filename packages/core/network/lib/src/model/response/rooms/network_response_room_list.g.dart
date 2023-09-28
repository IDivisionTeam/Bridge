// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_response_room_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkResponseRoomList _$NetworkResponseRoomListFromJson(
        Map<String, dynamic> json) =>
    NetworkResponseRoomList(
      (json['rooms'] as List<dynamic>)
          .map((e) => NetworkRoom.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['success'] as bool,
    );

Map<String, dynamic> _$NetworkResponseRoomListToJson(
        NetworkResponseRoomList instance) =>
    <String, dynamic>{
      'rooms': instance.rooms.map((e) => e.toJson()).toList(),
      'success': instance.success,
    };
