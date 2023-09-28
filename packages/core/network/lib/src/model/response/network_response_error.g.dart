// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_response_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkResponseError _$NetworkResponseErrorFromJson(
        Map<String, dynamic> json) =>
    NetworkResponseError(
      json['success'] as bool,
      json['message'] as String,
    );

Map<String, dynamic> _$NetworkResponseErrorToJson(
        NetworkResponseError instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
