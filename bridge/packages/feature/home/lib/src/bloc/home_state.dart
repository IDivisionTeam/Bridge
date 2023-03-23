part of 'home_bloc.dart';

class HomeState extends Equatable implements Copyable<HomeState> {
  // TODO(settings): add music on/off state
  // TODO(settings): add vibration on/off state

  const HomeState._({this.roomId = ''});

  const HomeState.initial() : this._();

  final String roomId;

  @override
  HomeState copy({String? roomId}) {
    return HomeState._(roomId: roomId ?? this.roomId);
  }

  @override
  List<Object> get props => [roomId];
}
