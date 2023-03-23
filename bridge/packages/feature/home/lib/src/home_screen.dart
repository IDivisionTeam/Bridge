import 'package:core_data/data.dart';
import 'package:feature_home/src/bloc/home_bloc.dart';
import 'package:feature_home/src/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required RoomRepository roomRepository,
    required UserRepository userRepository,
    required TokenRepository tokenRepository,
    required this.onNavAuthRequest,
    required this.onNavJoinGameRequest,
    required this.onNavHostGameRequest,
  })  : _roomRepository = roomRepository,
        _userRepository = userRepository,
        _tokenRepository = tokenRepository;

  final RoomRepository _roomRepository;
  final UserRepository _userRepository;
  final TokenRepository _tokenRepository;

  final VoidCallback? onNavAuthRequest;
  final VoidCallback? onNavJoinGameRequest;
  final void Function(String?)? onNavHostGameRequest;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(
        roomRepository: _roomRepository,
        userRepository: _userRepository,
        tokenRepository: _tokenRepository,
      ),
      child: HomeView(
        onNavAuthRequest: onNavAuthRequest,
        onNavJoinGameRequest: onNavJoinGameRequest,
        onNavHostGameRequest: onNavHostGameRequest,
      ),
    );
  }
}
