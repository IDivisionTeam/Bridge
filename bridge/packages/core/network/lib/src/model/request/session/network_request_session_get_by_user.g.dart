// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_request_session_get_by_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkRequestSessionGetByUser _$NetworkRequestSessionGetByUserFromJson(
        Map<String, dynamic> json) =>
    NetworkRequestSessionGetByUser(
      json['user_id'] as String,
      json['token'] as String,
    );

Map<String, dynamic> _$NetworkRequestSessionGetByUserToJson(
        NetworkRequestSessionGetByUser instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'token': instance.token,
    };
