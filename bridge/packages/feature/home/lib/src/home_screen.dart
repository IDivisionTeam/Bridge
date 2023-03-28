import 'package:core_data/data.dart';
import 'package:feature_home/src/bloc/home_bloc.dart';
import 'package:feature_home/src/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.onNavAuthRequest,
    required this.onNavJoinGameRequest,
    required this.onNavHostGameRequest,
  });

  final VoidCallback? onNavAuthRequest;
  final VoidCallback? onNavJoinGameRequest;
  final void Function(String?)? onNavHostGameRequest;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(
        roomRepository: context.read<RoomRepository>(),
        userRepository: context.read<UserRepository>(),
        tokenRepository: context.read<TokenRepository>(),
      ),
      child: HomeView(
        onNavAuthRequest: onNavAuthRequest,
        onNavJoinGameRequest: onNavJoinGameRequest,
        onNavHostGameRequest: onNavHostGameRequest,
      ),
    );
  }
}
