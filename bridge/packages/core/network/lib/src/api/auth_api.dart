import 'package:core_network/src/api/api_mixin.dart';
import 'package:core_network/src/model/request/auth/network_request_login.dart';
import 'package:core_network/src/model/request/auth/network_request_logout.dart';
import 'package:core_network/src/model/request/auth/network_request_register.dart';
import 'package:core_network/src/model/response/network_response.dart';

class AuthApi with ApiMixin {
  Future<NetworkResponse> signup(NetworkRequestRegister body) async =>
      post(to: 'auth/register', encodable: body);

  Future<NetworkResponse> login(NetworkRequestLogin body) async =>
      post(to: 'auth/login', encodable: body);

  Future<NetworkResponse> logout(NetworkRequestLogout body) async =>
      post(to: 'auth/logout', encodable: body);
}
