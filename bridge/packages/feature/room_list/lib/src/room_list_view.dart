import 'package:feature_room_list/src/bloc/room_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RoomListView extends StatefulWidget {
  const RoomListView({
    super.key,
    this.onNavJoinLobbyRequest,
  });

  final void Function(String?)? onNavJoinLobbyRequest;

  @override
  State<StatefulWidget> createState() => _RoomListViewState();
}

class _RoomListViewState extends State<RoomListView> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RoomListBloc, RoomListState>(
      listener: (context, state) {
        final roomId = state.roomIdToJoin;
        if (roomId.isNotEmpty) {
          context.read<RoomListBloc>().add(CleanLobbyId());
          widget.onNavJoinLobbyRequest?.call(roomId);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),
            Expanded(
              child: RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: () async {
                  context.read<RoomListBloc>().add(RoomListFetch());
                },
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: state.rooms.length,
                  itemBuilder: (BuildContext context, int index) {
                    final room = state.rooms[index];

                    return ListTile(
                      title: Text('${room.host.nickname}\`s room'),
                      leading: Icon(_getLockIcon(room.isOpen)),
                      trailing: Text('${room.users.length}/5'),
                      onTap: () {
                        context
                            .read<RoomListBloc>()
                            .add(JoinLobby(state.rooms[index].id));
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  IconData _getLockIcon(bool isOpen) {
    if (isOpen) return Icons.lock_open;
    return Icons.lock_outline;
  }
}
