// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_request_logout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkRequestLogout _$NetworkRequestLogoutFromJson(
        Map<String, dynamic> json) =>
    NetworkRequestLogout(
      json['email'] as String,
      json['token'] as String,
    );

Map<String, dynamic> _$NetworkRequestLogoutToJson(
        NetworkRequestLogout instance) =>
    <String, dynamic>{
      'email': instance.email,
      'token': instance.token,
    };
