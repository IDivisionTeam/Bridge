part of 'home_bloc.dart';

class HomeState extends Equatable implements Copyable<HomeState> {
  // TODO(settings): add music on/off state
  // TODO(settings): add vibration on/off state

  const HomeState();

  @override
  HomeState copy() => const HomeState();

  @override
  List<Object> get props => [];
}
