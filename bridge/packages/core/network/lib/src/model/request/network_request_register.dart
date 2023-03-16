import 'package:core_common/common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_request_register.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkRequestRegister implements Encodable {
  NetworkRequestRegister(this.email, this.nickname, this.password);

  final String email;
  final String nickname;
  final String password;

  factory NetworkRequestRegister.fromJson(Map<String, dynamic> json) => _$NetworkRequestRegisterFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkRequestRegisterToJson(this);
}
