import 'package:core_datastore/src/storage/secure_storage.dart';

class TokenLocalDataSource {
  final _secureStorage = SecureStorage();

  Future<void> setToken({required String token}) async =>
      _secureStorage.setToken(token: token);

  Future<String?> getToken() async => _secureStorage.getToken();

  Future<void> deleteToken() async => _secureStorage.deleteToken();
}
