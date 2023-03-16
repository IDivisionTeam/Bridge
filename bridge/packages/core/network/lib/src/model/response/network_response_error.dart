import 'package:json_annotation/json_annotation.dart';

part 'network_response_error.g.dart';

@JsonSerializable()
class NetworkResponseError {
  NetworkResponseError(this.success, this.message);

  final bool success;
  final String message;

  factory NetworkResponseError.fromJson(Map<String, dynamic> json) =>
      _$NetworkResponseErrorFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkResponseErrorToJson(this);
}
