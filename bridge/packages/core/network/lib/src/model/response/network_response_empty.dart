import 'package:json_annotation/json_annotation.dart';

part 'network_response_empty.g.dart';

@JsonSerializable()
class NetworkResponseEmpty {
  NetworkResponseEmpty(this.success);

  final bool success;

  factory NetworkResponseEmpty.fromJson(Map<String, dynamic> json) => _$NetworkResponseEmptyFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkResponseEmptyToJson(this);
}
