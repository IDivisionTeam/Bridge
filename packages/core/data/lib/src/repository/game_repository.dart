import 'package:core_common/common.dart';
import 'package:core_model/model.dart';
import 'package:core_network/network.dart';

class GameRepository {
  final _networkSource = SessionNetworkDataSource();

  Future<bool> closeSession({
    required String sessionId,
    required String userId,
    required String token,
  }) async {
    final result = await _networkSource.closeSession(
      sessionId: sessionId,
      userId: userId,
      token: token,
    );

    return result.getOrDefault(false);
  }

  Future<String?> createSession({
    required String roomId,
    required String userId,
    required String token,
  }) async {
    final result = await _networkSource.createSession(
      roomId: roomId,
      userId: userId,
      token: token,
    );

    return result.getOrNull();
  }

  Future<String?> getSessionByUser({
    required String userId,
    required String token,
  }) async {
    final result = await _networkSource.getSessionByUser(
      userId: userId,
      token: token,
    );

    return result.getOrNull();
  }

  Future<bool> layCard({
    required String card,
    required String playerId,
    required String sessionId,
    required String userId,
    required String token,
  }) async {
    final result = await _networkSource.layCard(
      card: card,
      playerId: playerId,
      sessionId: sessionId,
      userId: userId,
      token: token,
    );

    return result.getOrDefault(false);
  }

  Future<bool> nextTurn({
    required String playerId,
    required String sessionId,
    required String userId,
    required String token,
  }) async {
    final result = await _networkSource.nextTurn(
      playerId: playerId,
      sessionId: sessionId,
      userId: userId,
      token: token,
    );

    return result.getOrDefault(false);
  }

  Future<bool> pullCard({
    required String playerId,
    required String sessionId,
    required String userId,
    required String token,
  }) async {
    final result = await _networkSource.pullCard(
      playerId: playerId,
      sessionId: sessionId,
      userId: userId,
      token: token,
    );

    return result.getOrDefault(false);
  }

  Future<Session?> getSession({
    required String sessionId,
    required String userId,
    required String token,
  }) async {
    final result = await _networkSource.getSession(
      sessionId: sessionId,
      userId: userId,
      token: token,
    );

    return result.map((session) => mapToSession(session)).getOrNull();
  }

  Session mapToSession(NetworkSession networkSession) {
    final currentPlayer = networkSession.currentPlayer;

    return Session(
      networkSession.id,
      CurrentPlayer(
        currentPlayer.id,
        currentPlayer.sessionId,
        currentPlayer.cards,
        currentPlayer.name,
        currentPlayer.state,
      ),
      networkSession.deck,
      networkSession.players,
      networkSession.table,
    );
  }
}
