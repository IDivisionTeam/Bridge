import 'dart:async';

import 'package:core_common/common.dart';
import 'package:core_datastore/datastore.dart';
import 'package:core_network/network.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository implements Disposable {
  final _controller = StreamController<AuthenticationStatus>.broadcast();

  final _networkSource = AuthNetworkDataSource();
  final _tokenLocalSource = TokenLocalDataSource();
  final _userLocalSource = UserLocalDataSource();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));

    final token = await _tokenLocalSource.getToken();
    if (token == null) {
      yield AuthenticationStatus.unauthenticated;
    } else {
      yield AuthenticationStatus.authenticated;
    }

    yield* _controller.stream;
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final result = await _networkSource.login(
      email: email,
      password: password,
    );

    final user = result.getOrNull();
    if (user != null) {
      await _userLocalSource.setUser(
        id: user.id,
        email: email,
        nickname: user.nickname,
      );
      await _tokenLocalSource.setToken(token: user.token);

      _controller.add(AuthenticationStatus.authenticated);
      return;
    }

    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<void> logout({
    required String email,
    required String token,
  }) async {
    final result = await _networkSource.logout(email: email, token: token);

    final isSuccessful = result.getOrDefault(false);
    if (isSuccessful) {
      await _tokenLocalSource.deleteToken();
      await _userLocalSource.deleteUser();
      _controller.add(AuthenticationStatus.unauthenticated);
    }
  }

  Future<void> signup({
    required String email,
    required String nickname,
    required String password,
  }) async {
    final result = await _networkSource.signup(
      email: email,
      nickname: nickname,
      password: password,
    );

    final isSuccessful = result.getOrDefault(false);
    if (isSuccessful) login(email: email, password: password);
  }

  @override
  void dispose() => _controller.close();
}
