import 'package:core_network/src/api/auth_api.dart';
import 'package:core_network/src/model/request/network_request_login.dart';
import 'package:core_network/src/model/request/network_request_logout.dart';
import 'package:core_network/src/model/request/network_request_register.dart';
import 'package:core_network/src/model/response/network_response.dart';
import 'package:core_network/src/model/response/network_response_empty.dart';
import 'package:core_network/src/model/response/network_response_error.dart';
import 'package:core_network/src/model/response/network_response_user.dart';

class AuthNetworkDataSource {
  final _api = AuthApi();

  Future<NetworkResponse<bool>> signup({
    required String email,
    required String nickname,
    required String password,
  }) {
    final requestBody = NetworkRequestRegister(email, nickname, password);
    return _api.signup(requestBody).then((response) {
      try {
        final success = NetworkResponseEmpty.fromJson(response).success;
        return NetworkResponse.success(success);
      } catch (_) {
        return _extractError(response);
      }
    });
  }

  Future<NetworkResponse<NetworkUser>> login({
    required String email,
    required String password,
  }) {
    final requestBody = NetworkRequestLogin(email, password);
    return _api.login(requestBody).then((response) {
      try {
        final user = NetworkResponseUser.fromJson(response).user;
        return NetworkResponse.success(user);
      } catch (_) {
        return _extractError(response);
      }
    });
  }

  Future<NetworkResponse<bool>> logout({
    required String email,
    required String token,
  }) {
    final requestBody = NetworkRequestLogout(email, token);
    return _api.logout(requestBody).then((response) {
      try {
        final success = NetworkResponseEmpty.fromJson(response).success;
        return NetworkResponse.success(success);
      } catch (_) {
        return _extractError(response);
      }
    });
  }

  NetworkResponse<T> _extractError<T>(Map<String, dynamic> response) {
    final error = NetworkResponseError.fromJson(response);
    return NetworkResponse.failure(error);
  }
}
