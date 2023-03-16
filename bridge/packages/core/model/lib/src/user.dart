import 'package:common/common.dart';

class User implements Copyable<User> {
  const User({
    required this.id,
    required this.email,
    required this.nickname,
  });

  final String id;
  final String email;
  final String nickname;

  @override
  User copy({
    String? id,
    String? email,
    String? nickname,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      nickname: nickname ?? this.nickname,
    );
  }
}
