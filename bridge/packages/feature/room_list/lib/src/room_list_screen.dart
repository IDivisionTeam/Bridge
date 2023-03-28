import 'package:core_data/data.dart';
import 'package:feature_room_list/src/bloc/room_list_bloc.dart';
import 'package:feature_room_list/src/room_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomListScreen extends StatelessWidget {
  const RoomListScreen({
    super.key,
    this.onNavJoinLobbyRequest,
  });

  final void Function(String?)? onNavJoinLobbyRequest;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RoomListBloc(
        roomRepository: context.read<RoomRepository>(),
        userRepository: context.read<UserRepository>(),
        tokenRepository: context.read<TokenRepository>(),
      )..add(RoomListFetched()),
      child: RoomListView(
        onNavJoinLobbyRequest: onNavJoinLobbyRequest,
      ),
    );
  }
}
