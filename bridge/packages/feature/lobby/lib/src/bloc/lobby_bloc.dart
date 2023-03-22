import 'dart:async';

import 'package:core_common/common.dart';
import 'package:core_data/data.dart';
import 'package:core_model/model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'lobby_event.dart';

part 'lobby_state.dart';

class LobbyBloc extends Bloc<LobbyEvent, LobbyState> {
  LobbyBloc({
    required RoomRepository roomRepository,
    required UserRepository userRepository,
    required TokenRepository tokenRepository,
  })  : _roomRepository = roomRepository,
        _userRepository = userRepository,
        _tokenRepository = tokenRepository,
        super(const LobbyState.initial()) {
    on<_LobbyStatusChanged>(_lobbyChanged);
    on<FetchLobby>(_fetchLobby);
    on<DeleteLobby>(_deleteLobby);
  }

  final RoomRepository _roomRepository;
  final UserRepository _userRepository;
  final TokenRepository _tokenRepository;
  late StreamSubscription<Room?> _lobbySubscription;

  Future<void> _lobbyChanged(
    _LobbyStatusChanged event,
    Emitter<LobbyState> emit,
  ) async {
    final User? user = await _userRepository.getUser();
    if (user != null) {
      final hostId = event.room?.host.id;
      emit(state.copy(
        status: LobbyStatus.waiting,
        isUserHost: (hostId != null) && (user.id == hostId),
        room: event.room,
      ));
    }
  }

  Future<void> _fetchLobby(
    FetchLobby event,
    Emitter<LobbyState> emit,
  ) async {
    final String? token = await _tokenRepository.getToken();
    final User? user = await _userRepository.getUser();

    if (token != null && user != null) {
      _lobbySubscription = _roomRepository
          .getRoomStream(event.roomId, token, user.id)
          .listen((room) => add(_LobbyStatusChanged(room)));
    }
  }

  Future<void> _deleteLobby(
    DeleteLobby event,
    Emitter<LobbyState> emit,
  ) async {
    final roomId = state.room?.id;
    if (roomId == null) return;

    final String? token = await _tokenRepository.getToken();
    final User? user = await _userRepository.getUser();

    if (token != null && user != null) {
      if (state.isUserHost) {
        await _roomRepository.deleteRoom(
          roomId: roomId,
          token: token,
          userId: user.id,
        );
      }
    }
    emit(state.copy(
      status: LobbyStatus.closed,
      room: null,
    ));
  }

  @override
  Future<void> close() {
    _lobbySubscription.cancel();
    return super.close();
  }
}
