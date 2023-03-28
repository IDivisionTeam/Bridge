import 'package:core_common/common.dart';

class RoomUser implements Copyable<RoomUser> {
  const RoomUser({
    required this.id,
    required this.nickname,
  });

  final String id;
  final String nickname;

  @override
  RoomUser copy({
    String? id,
    String? nickname,
  }) {
    return RoomUser(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
    );
  }
}
