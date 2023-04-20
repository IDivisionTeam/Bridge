import 'package:core_network/src/api/api_mixin.dart';
import 'package:core_network/src/model/request/session/network_request_session.dart';
import 'package:core_network/src/model/request/session/network_request_session_close.dart';
import 'package:core_network/src/model/request/session/network_request_session_create.dart';
import 'package:core_network/src/model/request/session/network_request_session_get_by_user.dart';
import 'package:core_network/src/model/request/session/network_request_session_lay_card.dart';
import 'package:core_network/src/model/request/session/network_request_session_next_turn.dart';
import 'package:core_network/src/model/request/session/network_request_session_pull_card.dart';
import 'package:core_network/src/model/response/network_response.dart';

class SessionApi with ApiMixin {
  Future<NetworkResponse> closeSession(
    NetworkRequestSessionClose body,
  ) async =>
      post(to: 'session/close', encodable: body);

  Future<NetworkResponse> createSession(
    NetworkRequestSessionCreate body,
  ) async =>
      post(to: 'session/create', encodable: body);

  Future<NetworkResponse> getSessionByUser(
    NetworkRequestSessionGetByUser body,
  ) async =>
      post(to: 'session/getByUser', encodable: body);

  Future<NetworkResponse> layCard(
    NetworkRequestSessionLayCard body,
  ) async =>
      post(to: 'session/lay', encodable: body);

  Future<NetworkResponse> nextTurn(
    NetworkRequestSessionNextTurn body,
  ) async =>
      post(to: 'session/nextTurn', encodable: body);

  Future<NetworkResponse> pullCard(
    NetworkRequestSessionPullCard body,
  ) async =>
      post(to: 'session/pull', encodable: body);

  Future<NetworkResponse> getSession(
    NetworkRequestSession body,
  ) async =>
      get(
        from: 'session/${body.sessionId}',
        parameters: withIdentity(
          userId: body.userId,
          token: body.token,
        ),
      );
}
