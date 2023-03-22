part of 'home_bloc.dart';

class HomeState extends Equatable implements Copyable<HomeState> {
  // TODO(settings): add music on/off state
  // TODO(settings): add vibration on/off state

  const HomeState({this.roomId = ''});

  final String roomId;

  @override
  HomeState copy({String? roomId}) {
    return HomeState(roomId: roomId ?? this.roomId);
  }

  @override
  List<Object> get props => [roomId];
}
