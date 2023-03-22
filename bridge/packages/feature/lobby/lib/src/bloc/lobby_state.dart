part of 'lobby_bloc.dart';

enum LobbyStatus { created, waiting, started, closed }

class LobbyState extends Equatable implements Copyable<LobbyState> {
  const LobbyState._({
    this.status = LobbyStatus.created,
    this.isUserHost = false,
    this.room,
  });

  final Room? room;
  final bool isUserHost;
  final LobbyStatus status;

  const LobbyState.initial() : this._();

  @override
  LobbyState copy({
    LobbyStatus? status,
    bool? isUserHost,
    Room? room,
  }) {
    return LobbyState._(
      status: status ?? this.status,
      isUserHost: isUserHost ?? this.isUserHost,
      room: room ?? this.room,
    );
  }

  @override
  List<Object?> get props => [status, room];
}
