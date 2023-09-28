import 'package:core_datastore/src/storage/preferences_storage.dart';
import 'package:core_model/model.dart';

class UserLocalDataSource {
  final _prefs = PreferencesStorage();

  Future<void> setUser({
    required String id,
    required String email,
    required String nickname,
  }) async {
    _prefs.setUser(id: id, email: email, nickname: nickname);
  }

  Future<User?> getUser() async => _prefs.getUser();

  Future<void> deleteUser() async => _prefs.deleteUser();
}
