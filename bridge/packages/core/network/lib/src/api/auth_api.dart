import 'package:core_network/src/api/api_mixin.dart';
import 'package:core_network/src/model/request/auth/network_request_login.dart';
import 'package:core_network/src/model/request/auth/network_request_logout.dart';
import 'package:core_network/src/model/request/auth/network_request_register.dart';

class AuthApi with ApiMixin {
  Future<Map<String, dynamic>> signup(NetworkRequestRegister body) async =>
      post(to: 'auth/register', encodable: body);

  Future<Map<String, dynamic>> login(NetworkRequestLogin body) async =>
      post(to: 'auth/login', encodable: body);

  Future<Map<String, dynamic>> logout(NetworkRequestLogout body) async =>
      post(to: 'auth/logout', encodable: body);
}
