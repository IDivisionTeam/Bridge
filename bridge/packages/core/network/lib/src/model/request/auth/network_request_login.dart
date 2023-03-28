import 'package:core_common/common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_request_login.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkRequestLogin implements Encodable {
  const NetworkRequestLogin(this.email, this.password);

  final String email;
  final String password;

  factory NetworkRequestLogin.fromJson(Map<String, dynamic> json) =>
      _$NetworkRequestLoginFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkRequestLoginToJson(this);
}
