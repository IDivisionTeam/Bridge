import 'package:core_model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesStorage {
  static const _userIdKey = 'user-id_9n8HN.key';
  static const _userEmailKey = 'user-email_qq9z^E.key';
  static const _userNicknameKey = 'user-nickname_7b6t^Gt.key';

  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    final String? userId = await prefs.getString(_userIdKey);
    final String? userNickname = await prefs.getString(_userNicknameKey);
    final String? userEmail = await prefs.getString(_userEmailKey);

    if (userId == null || userNickname == null || userEmail == null)
      return null;

    return User(id: userId, email: userEmail, nickname: userNickname);
  }

  Future<void> setUser({
    required String id,
    required String email,
    required String nickname,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(_userIdKey, id);
    prefs.setString(_userEmailKey, email);
    prefs.setString(_userNicknameKey, nickname);
  }

  Future<void> deleteUser() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove(_userIdKey);
    prefs.remove(_userEmailKey);
    prefs.remove(_userNicknameKey);
  }
}
