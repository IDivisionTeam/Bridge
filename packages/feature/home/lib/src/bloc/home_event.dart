part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeRoomCreated extends HomeEvent {
  const HomeRoomCreated();
}

class HomeRoomIdCleaned extends HomeEvent {
  const HomeRoomIdCleaned();
}
