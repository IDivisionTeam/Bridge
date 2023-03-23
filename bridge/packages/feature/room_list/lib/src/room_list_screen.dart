import 'package:core_data/data.dart';
import 'package:feature_room_list/src/bloc/room_list_bloc.dart';
import 'package:feature_room_list/src/room_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomListScreen extends StatelessWidget {
  const RoomListScreen({
    super.key,
    required RoomRepository roomRepository,
    required UserRepository userRepository,
    required TokenRepository tokenRepository,
    this.onNavJoinLobbyRequest,
  })  : _roomRepository = roomRepository,
        _userRepository = userRepository,
        _tokenRepository = tokenRepository;

  final RoomRepository _roomRepository;
  final UserRepository _userRepository;
  final TokenRepository _tokenRepository;

  final void Function(String?)? onNavJoinLobbyRequest;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RoomListBloc(
        roomRepository: _roomRepository,
        userRepository: _userRepository,
        tokenRepository: _tokenRepository,
      )..add(RoomListFetched()),
      child: RoomListView(
        onNavJoinLobbyRequest: onNavJoinLobbyRequest,
      ),
    );
  }
}
