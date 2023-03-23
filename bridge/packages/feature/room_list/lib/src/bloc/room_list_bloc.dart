import 'package:core_common/common.dart';
import 'package:core_data/data.dart';
import 'package:core_model/model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'room_list_event.dart';

part 'room_list_state.dart';

class RoomListBloc extends Bloc<RoomListEvent, RoomListState> {
  RoomListBloc({
    required RoomRepository roomRepository,
    required UserRepository userRepository,
    required TokenRepository tokenRepository,
  })  : _roomRepository = roomRepository,
        _userRepository = userRepository,
        _tokenRepository = tokenRepository,
        super(const RoomListState.initial()) {
    on<RoomListFetched>(_roomListFetched);
    on<RoomUserJoined>(_roomUserJoined);
    on<RoomIdCleaned>(_roomIdCleaned);
  }

  final RoomRepository _roomRepository;
  final UserRepository _userRepository;
  final TokenRepository _tokenRepository;

  Future<void> _roomListFetched(
    RoomListFetched event,
    Emitter<RoomListState> emit,
  ) async {
    try {
      final String? token = await _tokenRepository.getToken();
      final User? user = await _userRepository.getUser();

      if (token != null && user != null) {
        final List<Room> rooms = await _roomRepository.listRooms(
          token: token,
          userId: user.id,
        );

        emit(state.copy(rooms: rooms));
      }
    } catch (_) {
      emit(state.copy(rooms: List.empty()));
    }
  }

  Future<void> _roomUserJoined(
    RoomUserJoined event,
    Emitter<RoomListState> emit,
  ) async {
    final String? token = await _tokenRepository.getToken();
    final User? user = await _userRepository.getUser();

    if (token != null && user != null) {
      final roomId = event.roomId;
      await _roomRepository.joinRoom(
          roomId: roomId, token: token, userId: user.id);

      emit(state.copy(roomIdToJoin: roomId));
    }
  }

  Future<void> _roomIdCleaned(
    RoomIdCleaned event,
    Emitter<RoomListState> emit,
  ) async {
    emit(state.copy(roomIdToJoin: ''));
  }
}
