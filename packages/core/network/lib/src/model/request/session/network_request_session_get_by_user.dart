import 'package:core_common/common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_request_session_get_by_user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkRequestSessionGetByUser implements Encodable {
  const NetworkRequestSessionGetByUser(
    this.userId,
    this.token,
  );

  final String userId;
  final String token;

  factory NetworkRequestSessionGetByUser.fromJson(Map<String, dynamic> json) =>
      _$NetworkRequestSessionGetByUserFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkRequestSessionGetByUserToJson(this);
}
