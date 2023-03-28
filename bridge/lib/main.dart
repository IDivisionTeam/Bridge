import 'package:bridge/ui/application.dart';
import 'package:core_data/data.dart';
import 'package:flutter/material.dart';

void main() {
  final authenticationRepository = AuthenticationRepository();
  final roomRepository = RoomRepository();
  final userRepository = UserRepository();
  final tokenRepository = TokenRepository();

  runApp(Application(
    authenticationRepository: authenticationRepository,
    roomRepository: roomRepository,
    userRepository: userRepository,
    tokenRepository: tokenRepository,
  ));
}
