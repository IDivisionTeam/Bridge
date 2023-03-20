import 'package:core_common/common.dart';
import 'package:core_datastore/datastore.dart';

class TokenRepository implements Disposable {
  final _localSource = TokenLocalDataSource();
  String? _token = null;

  Future<String?> getToken() async => _getToken();

  Future<String?> _getToken() async {
    if (_token != null) return _token;

    try {
      _token = await _localSource.getToken();
    } catch (_) {
      return null;
    }
    return _token;
  }

  @override
  void dispose() {
    _token = null;
  }
}
