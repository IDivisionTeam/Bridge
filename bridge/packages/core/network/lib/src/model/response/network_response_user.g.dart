// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_response_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkResponseUser _$NetworkResponseUserFromJson(Map<String, dynamic> json) => NetworkResponseUser(
      json['success'] as bool,
      NetworkUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NetworkResponseUserToJson(NetworkResponseUser instance) => <String, dynamic>{
      'success': instance.success,
      'user': instance.user.toJson(),
    };

NetworkUser _$NetworkUserFromJson(Map<String, dynamic> json) => NetworkUser(
      json['id'] as String,
      json['nickname'] as String,
      json['token'] as String,
    );

Map<String, dynamic> _$NetworkUserToJson(NetworkUser instance) => <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'token': instance.token,
    };
