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
    on<_LobbyRoomUpdated>(_lobbyRoomUpdated);
    on<LobbyRoomFetched>(_lobbyRoomFetched);
    on<LobbyRoomDeleted>(_lobbyRoomDeleted);
  }

  final RoomRepository _roomRepository;
  final UserRepository _userRepository;
  final TokenRepository _tokenRepository;
  late StreamSubscription<Room?> _lobbySubscription;

  Future<void> _lobbyRoomUpdated(
    _LobbyRoomUpdated event,
    Emitter<LobbyState> emit,
  ) async {
    final User? user = await _userRepository.getUser();
    if (user != null) {
      final hostId = event.room?.host.id;

      emit(
        LobbyState.waiting(
          room: event.room,
          isUserHost: (hostId != null) && (user.id == hostId),
        ),
      );
    }
  }

  Future<void> _lobbyRoomFetched(
    LobbyRoomFetched event,
    Emitter<LobbyState> emit,
  ) async {
    final String? token = await _tokenRepository.getToken();
    final User? user = await _userRepository.getUser();

    if (token != null && user != null) {
      _lobbySubscription =
          _roomRepository.getRoomStream(event.roomId, token, user.id).listen((room) => add(_LobbyRoomUpdated(room)));
    }
  }

  Future<void> _lobbyRoomDeleted(
    LobbyRoomDeleted event,
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

    emit(LobbyState.closed());
  }

  @override
  Future<void> close() {
    _lobbySubscription.cancel();
    return super.close();
  }
}
