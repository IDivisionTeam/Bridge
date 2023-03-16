import 'package:core_common/common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_request_logout.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkRequestLogout implements Encodable {
  NetworkRequestLogout(this.email, this.token);

  final String email;
  final String token;

  factory NetworkRequestLogout.fromJson(Map<String, dynamic> json) =>
      _$NetworkRequestLogoutFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkRequestLogoutToJson(this);
}
