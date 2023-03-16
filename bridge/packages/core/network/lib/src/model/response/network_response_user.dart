import 'package:json_annotation/json_annotation.dart';

part 'network_response_user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class NetworkResponseUser {
  NetworkResponseUser(this.success, this.user);

  final bool success;
  final NetworkUser user;

  factory NetworkResponseUser.fromJson(Map<String, dynamic> json) =>
      _$NetworkResponseUserFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkResponseUserToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkUser {
  NetworkUser(this.id, this.nickname, this.token);

  final String id;
  final String nickname;
  final String token;

  factory NetworkUser.fromJson(Map<String, dynamic> json) =>
      _$NetworkUserFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkUserToJson(this);
}
