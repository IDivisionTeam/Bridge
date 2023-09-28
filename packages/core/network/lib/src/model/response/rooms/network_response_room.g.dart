// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_response_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkResponseRoom _$NetworkResponseRoomFromJson(Map<String, dynamic> json) =>
    NetworkResponseRoom(
      NetworkRoom.fromJson(json['room'] as Map<String, dynamic>),
      json['success'] as bool,
    );

Map<String, dynamic> _$NetworkResponseRoomToJson(
        NetworkResponseRoom instance) =>
    <String, dynamic>{
      'room': instance.room.toJson(),
      'success': instance.success,
    };

NetworkRoom _$NetworkRoomFromJson(Map<String, dynamic> json) => NetworkRoom(
      json['id'] as String,
      NetworkUser.fromJson(json['host'] as Map<String, dynamic>),
      (json['users'] as List<dynamic>)
          .map((e) => NetworkUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['open'] as bool,
    );

Map<String, dynamic> _$NetworkRoomToJson(NetworkRoom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'host': instance.host.toJson(),
      'users': instance.users.map((e) => e.toJson()).toList(),
      'open': instance.isOpen,
    };

NetworkUser _$NetworkUserFromJson(Map<String, dynamic> json) => NetworkUser(
      json['id'] as String,
      json['nickname'] as String,
    );

Map<String, dynamic> _$NetworkUserToJson(NetworkUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
    };
