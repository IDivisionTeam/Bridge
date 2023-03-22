import 'package:core_common/common.dart';
import 'package:core_data/data.dart';
import 'package:core_model/model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required RoomRepository roomRepository,
    required UserRepository userRepository,
    required TokenRepository tokenRepository,
  })  : _roomRepository = roomRepository,
        _userRepository = userRepository,
        _tokenRepository = tokenRepository,
        super(const HomeState()) {
    on<CreateRoom>(_createRoom);
    on<CleanRoomId>(_cleanRoomId);
  }

  final RoomRepository _roomRepository;
  final UserRepository _userRepository;
  final TokenRepository _tokenRepository;

  Future<void> _createRoom(
    CreateRoom event,
    Emitter<HomeState> emit,
  ) async {
    final String? token = await _tokenRepository.getToken();
    final User? user = await _userRepository.getUser();
    if (token != null && user != null) {
      final roomId =
          await _roomRepository.createRoom(token: token, userId: user.id);
      emit(state.copy(roomId: roomId));
    }
  }

  Future<void> _cleanRoomId(
    CleanRoomId event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copy(roomId: ''));
  }
}
