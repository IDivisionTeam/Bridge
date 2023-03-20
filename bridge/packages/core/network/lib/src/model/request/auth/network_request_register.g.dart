// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_request_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkRequestRegister _$NetworkRequestRegisterFromJson(
        Map<String, dynamic> json) =>
    NetworkRequestRegister(
      json['email'] as String,
      json['nickname'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$NetworkRequestRegisterToJson(
        NetworkRequestRegister instance) =>
    <String, dynamic>{
      'email': instance.email,
      'nickname': instance.nickname,
      'password': instance.password,
    };
