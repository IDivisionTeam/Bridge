import 'package:core_common/common.dart';
import 'package:core_model/src/room/room_user.dart';

class Room implements Copyable<Room> {
  const Room({
    required this.id,
    required this.host,
    required this.users,
    required this.isOpen,
  });

  final String id;
  final RoomUser host;
  final List<RoomUser> users;
  final bool isOpen;

  @override
  Room copy({
    String? id,
    RoomUser? host,
    List<RoomUser>? users,
    bool? isOpen,
  }) {
    return Room(
      id: id ?? this.id,
      host: host ?? this.host,
      users: users ?? this.users,
      isOpen: isOpen ?? this.isOpen,
    );
  }
}
