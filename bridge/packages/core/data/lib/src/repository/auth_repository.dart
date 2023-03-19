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

    final token =
        await _tokenLocalSource.getToken().then((token) => token.orEmpty());
    if (token.isEmpty) {
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
    await _networkSource
        .login(email: email, password: password)
        .then((response) {
      if (response.hasData) {
        final user = response.data!;
        _userLocalSource.setUser(
            id: user.id, email: email, nickname: user.nickname);
        _tokenLocalSource.setToken(token: user.token);
      }
    }).whenComplete(() => _controller.add(AuthenticationStatus.authenticated));
  }

  Future<void> logout({
    required String email,
    required String token,
  }) async {
    await _networkSource.logout(email: email, token: token).then((_) {
      _tokenLocalSource.deleteToken();
      _userLocalSource.deleteUser();
    }).whenComplete(() {
      _controller.add(AuthenticationStatus.unauthenticated);
    });
  }

  Future<void> signup({
    required String email,
    required String nickname,
    required String password,
  }) async {
    await _networkSource
        .signup(email: email, nickname: nickname, password: password)
        .then((value) => login(email: email, password: password));
  }

  @override
  void dispose() => _controller.close();
}
