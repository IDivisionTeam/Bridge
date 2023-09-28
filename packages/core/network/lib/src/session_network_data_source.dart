import 'package:core_common/common.dart';
import 'package:core_network/src/api/session_api.dart';
import 'package:core_network/src/model/request/session/network_request_session.dart';
import 'package:core_network/src/model/request/session/network_request_session_close.dart';
import 'package:core_network/src/model/request/session/network_request_session_create.dart';
import 'package:core_network/src/model/request/session/network_request_session_get_by_user.dart';
import 'package:core_network/src/model/request/session/network_request_session_lay_card.dart';
import 'package:core_network/src/model/request/session/network_request_session_next_turn.dart';
import 'package:core_network/src/model/request/session/network_request_session_pull_card.dart';
import 'package:core_network/src/model/response/network_response_empty.dart';
import 'package:core_network/src/model/response/session/network_response_session.dart';
import 'package:core_network/src/model/response/session/network_response_session_id.dart';

class SessionNetworkDataSource {
  final _api = SessionApi();

  Future<Result<bool>> closeSession({
    required String sessionId,
    required String userId,
    required String token,
  }) async {
    final requestBody = NetworkRequestSessionClose(sessionId, userId, token);

    final response = await _api.closeSession(requestBody);
    if (response.hasError) return Result.failure(response.error!);

    final success = NetworkResponseEmpty.fromJson(response.data!).success;
    return Result.success(success);
  }

  Future<Result<String>> createSession({
    required String roomId,
    required String userId,
    required String token,
  }) async {
    final requestBody = NetworkRequestSessionCreate(roomId, userId, token);

    final response = await _api.createSession(requestBody);
    if (response.hasError) return Result.failure(response.error!);

    final sessionId =
        NetworkResponseSessionId.fromJson(response.data!).sessionId;
    return Result.success(sessionId);
  }

  Future<Result<String>> getSessionByUser({
    required String userId,
    required String token,
  }) async {
    final requestBody = NetworkRequestSessionGetByUser(userId, token);

    final response = await _api.getSessionByUser(requestBody);
    if (response.hasError) return Result.failure(response.error!);

    final sessionId =
        NetworkResponseSessionId.fromJson(response.data!).sessionId;
    return Result.success(sessionId);
  }

  Future<Result<bool>> layCard({
    required String card,
    required String playerId,
    required String sessionId,
    required String userId,
    required String token,
  }) async {
    final requestBody = NetworkRequestSessionLayCard(
      card,
      playerId,
      sessionId,
      userId,
      token,
    );

    final response = await _api.layCard(requestBody);
    if (response.hasError) return Result.failure(response.error!);

    final success = NetworkResponseEmpty.fromJson(response.data!).success;
    return Result.success(success);
  }

  Future<Result<bool>> nextTurn({
    required String playerId,
    required String sessionId,
    required String userId,
    required String token,
  }) async {
    final requestBody = NetworkRequestSessionNextTurn(
      playerId,
      sessionId,
      userId,
      token,
    );

    final response = await _api.nextTurn(requestBody);
    if (response.hasError) return Result.failure(response.error!);

    final success = NetworkResponseEmpty.fromJson(response.data!).success;
    return Result.success(success);
  }

  Future<Result<bool>> pullCard({
    required String playerId,
    required String sessionId,
    required String userId,
    required String token,
  }) async {
    final requestBody = NetworkRequestSessionPullCard(
      playerId,
      sessionId,
      userId,
      token,
    );

    final response = await _api.pullCard(requestBody);
    if (response.hasError) return Result.failure(response.error!);

    final success = NetworkResponseEmpty.fromJson(response.data!).success;
    return Result.success(success);
  }

  Future<Result<NetworkSession>> getSession({
    required String sessionId,
    required String userId,
    required String token,
  }) async {
    final requestBody = NetworkRequestSession(
      sessionId,
      userId,
      token,
    );

    final response = await _api.getSession(requestBody);
    if (response.hasError) return Result.failure(response.error!);

    final session = NetworkResponseSession.fromJson(response.data!).session;
    return Result.success(session);
  }
}
