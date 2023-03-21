import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const String roomListRoute = '/roomList';

extension RoomListNavigation on BuildContext {
  void navigateToRoomList() => push(roomListRoute);
}

extension RoomListNavigationRouter on GoRouter {
  void navigateToRoomList() => push(roomListRoute);
}
