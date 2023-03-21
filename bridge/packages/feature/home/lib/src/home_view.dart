import 'dart:math' as math;

import 'package:core_bloc/bloc.dart';
import 'package:core_data/data.dart';
import 'package:core_designsystem/designsystem.dart';
import 'package:core_ui/ui.dart';
import 'package:feature_home/src/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.onNavAuthRequest,
    required this.onNavJoinGameRequest,
  });

  final VoidCallback? onNavAuthRequest;
  final VoidCallback? onNavJoinGameRequest;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            // TODO(home): handle errors.
          },
        ),
        BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state.status == AuthenticationStatus.unauthenticated) {
              onNavAuthRequest?.call();
            }
          },
        ),
      ],
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  color: Colors.yellow,
                  transformAlignment: Alignment.center,
                  margin: EdgeInsets.only(top: 64),
                  transform: Matrix4.rotationZ(170 * math.pi / 180),
                  child: BridgeCard(
                    // FIXME(playing-card): randomize rank & suit.
                    rank: 'J',
                    suit: 'C',
                    ratio: 0.2,
                  ),
                ),
                Container(
                  color: Colors.yellow,
                  transformAlignment: Alignment.center,
                  transform: Matrix4.rotationZ(200 * math.pi / 180),
                  child: BridgeCard(
                    // FIXME(playing-card): randomize rank & suit.
                    rank: 'K',
                    suit: 'D',
                    ratio: 0.2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 64),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: BridgeButton(
                onClick: () {
                  onNavJoinGameRequest?.call();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(36),
                ),
                child: const Text('Join Game'),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: BridgeButton(
                onClick: () {
                  // TODO(lobby): add navigation to Lobby
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(36),
                ),
                child: const Text('Host Game'),
              ),
            ),
            const SizedBox(height: 64),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // TODO(settings): add on/off icon
                IconButton(
                  icon: const Icon(Icons.music_note),
                  onPressed: () {
                    // TODO(settings): change music to on/off
                  },
                ),
                // TODO(settings): add on/off icon
                IconButton(
                  icon: const Icon(Icons.vibration),
                  onPressed: () {
                    // TODO(settings): change vibration to on/off
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    context
                        .read<AuthenticationBloc>()
                        .add(AuthenticationLogoutRequested());
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
