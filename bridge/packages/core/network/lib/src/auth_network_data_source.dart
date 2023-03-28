import 'package:core_common/common.dart';
import 'package:core_network/src/api/auth_api.dart';
import 'package:core_network/src/model/request/auth/network_request_login.dart';
import 'package:core_network/src/model/request/auth/network_request_logout.dart';
import 'package:core_network/src/model/request/auth/network_request_register.dart';
import 'package:core_network/src/model/response/auth/network_response_user.dart';
import 'package:core_network/src/model/response/network_response_empty.dart';

class AuthNetworkDataSource {
  final _api = AuthApi();

  Future<Result<bool>> signup({
    required String email,
    required String nickname,
    required String password,
  }) {
    final requestBody = NetworkRequestRegister(email, nickname, password);
    return _api.signup(requestBody).then((response) {
      if (response.hasError) return Result.failure(response.error!);

      final success = NetworkResponseEmpty.fromJson(response.data!).success;
      return Result.success(success);
    });
  }

  Future<Result<NetworkUser>> login({
    required String email,
    required String password,
  }) {
    final requestBody = NetworkRequestLogin(email, password);
    return _api.login(requestBody).then((response) {
      if (response.hasError) return Result.failure(response.error!);

      final success = NetworkResponseUser.fromJson(response.data!).user;
      return Result.success(success);
    });
  }

  Future<Result<bool>> logout({
    required String email,
    required String token,
  }) {
    final requestBody = NetworkRequestLogout(email, token);
    return _api.logout(requestBody).then((response) {
      if (response.hasError) return Result.failure(response.error!);

      final success = NetworkResponseEmpty.fromJson(response.data!).success;
      return Result.success(success);
    });
  }
}
