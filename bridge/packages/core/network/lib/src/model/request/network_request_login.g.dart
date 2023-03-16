// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_request_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkRequestLogin _$NetworkRequestLoginFromJson(Map<String, dynamic> json) =>
    NetworkRequestLogin(
      json['email'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$NetworkRequestLoginToJson(
        NetworkRequestLogin instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
