import 'package:core_data/data.dart';
import 'package:feature_room_list/src/bloc/room_list_bloc.dart';
import 'package:feature_room_list/src/room_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomListScreen extends StatefulWidget {
  const RoomListScreen({super.key});

  @override
  State<RoomListScreen> createState() => _RoomListState();
}

class _RoomListState extends State<RoomListScreen> {
  late final RoomRepository _roomRepository;
  late final UserRepository _userRepository;
  late final TokenRepository _tokenRepository;

  @override
  void initState() {
    super.initState();
    _roomRepository = RoomRepository();
    _userRepository = UserRepository();
    _tokenRepository = TokenRepository();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<RoomRepository>(
          create: (context) => _roomRepository,
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => _userRepository,
        ),
        RepositoryProvider<TokenRepository>(
          create: (context) => _tokenRepository,
        ),
      ],
      child: BlocProvider(
        create: (_) => RoomListBloc(
          roomRepository: _roomRepository,
          userRepository: _userRepository,
          tokenRepository: _tokenRepository,
        )..add(RoomListFetch()),
        child: RoomListView(),
      ),
    );
  }

  @override
  void dispose() {
    _roomRepository.dispose();
    _userRepository.dispose();
    _tokenRepository.dispose();
    super.dispose();
  }
}
