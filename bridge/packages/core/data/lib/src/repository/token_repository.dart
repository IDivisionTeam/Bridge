import 'package:core_datastore/datastore.dart';

class TokenRepository {
  final _localSource = TokenLocalDataSource();

  Future<String?> getToken() async => _localSource.getToken();
}
