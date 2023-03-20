import 'package:core_common/common.dart';
import 'package:core_datastore/datastore.dart';
import 'package:core_model/model.dart';

class UserRepository implements Disposable {
  final _localSource = UserLocalDataSource();
  User? _user = null;

  Future<User?> getUser() async => _getUser();

  Future<User?> _getUser() async {
    if (_user != null) return _user;

    try {
      _user = await _localSource.getUser();
    } catch (_) {
      return null;
    }
    return _user;
  }

  @override
  void dispose() {
    _user = null;
  }
}
