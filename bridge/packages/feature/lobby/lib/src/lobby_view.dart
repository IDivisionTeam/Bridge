// TODO(game): call SessionAPI.create when host starts the Game
// TODO(game): call SessionAPI.getByUser when Lobby isOpen == false (means game started)

import 'dart:math';

import 'package:core_designsystem/designsystem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/lobby_bloc.dart';

class LobbyView extends StatelessWidget {
  const LobbyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LobbyBloc, LobbyState>(
      listener: (context, state) {
        switch (state.status) {
          case LobbyStatus.started:
            // TODO(game): redirect to the game
            break;
          case LobbyStatus.closed:
            context.pop();
            break;
          default:
            break;
        }
      },
      builder: (context, state) {
        final users = state.room?.users ?? List.empty();

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    context.read<LobbyBloc>().add(LobbyRoomDeleted());
                  },
                ),
              ],
            ),
            if (state.status == LobbyStatus.waiting)
              Container(
                alignment: Alignment.center,
                child: Text('Waiting for lobby leader...'),
              ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  final user = users[index];

                  return ListTile(
                    title: Text(user.nickname),
                    leading: _UserCircle(
                      letter: user.nickname[0],
                    ),
                  );
                },
              ),
            ),
            if (state.isUserHost)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: BridgeButton(
                  onClick: () {
                    //TODO(game): start game
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(36),
                  ),
                  child: const Text('Start'),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _UserCircle extends StatefulWidget {
  _UserCircle({
    super.key,
    this.letter = '',
  });

  final String letter;
  final Color bgColor =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  State createState() => _UserCircleState();
}

class _UserCircleState extends State<_UserCircle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: widget.bgColor,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(widget.letter.toUpperCase()),
    );
  }
}
