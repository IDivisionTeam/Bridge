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
        super(const HomeState.initial()) {
    on<HomeRoomCreated>(_homeRoomCreated);
    on<HomeRoomIdCleaned>(_homeRoomIdCleaned);
  }

  final RoomRepository _roomRepository;
  final UserRepository _userRepository;
  final TokenRepository _tokenRepository;

  Future<void> _homeRoomCreated(
    HomeRoomCreated event,
    Emitter<HomeState> emit,
  ) async {
    final String? token = await _tokenRepository.getToken();
    final User? user = await _userRepository.getUser();

    if (token != null && user != null) {
      final roomId = await _roomRepository.createRoom(
        token: token,
        userId: user.id,
      );
      emit(state.copy(roomId: roomId));
    }
  }

  Future<void> _homeRoomIdCleaned(
    HomeRoomIdCleaned event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copy(roomId: ''));
  }
}
