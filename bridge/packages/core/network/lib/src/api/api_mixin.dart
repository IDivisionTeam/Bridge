import 'package:core_common/common.dart';
import 'package:core_network/src/util/decoder_extension.dart';
import 'package:core_network/src/util/encoder_extension.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:meta/meta.dart';

mixin ApiMixin {
  static const _baseUrl = 'bridge.zalizniak.duckdns.org';

  @protected
  Future<Map<String, dynamic>> post({
    required String to,
    required Encodable? encodable,
  }) async {
    assert(to.isNotEmpty);
    final client = RetryClient(http.Client());

    try {
      var response = await client.post(
        Uri.http(_baseUrl, to),
        body: encodable?.json,
      );

      return response.responseBody;
    } finally {
      client.close();
    }
  }

  @protected
  Future<Map<String, dynamic>> get({
    required String from,
    required Map<String, dynamic>? parameters,
  }) async {
    assert(from.isNotEmpty);
    final client = RetryClient(http.Client());

    try {
      var response = await client.get(
        Uri.http(_baseUrl, from, parameters),
      );

      return response.responseBody;
    } finally {
      client.close();
    }
  }

  @protected
  Map<String, String> withIdentity({
    required String userId,
    required String token,
  }) {
    return {
      'user_id': userId,
      'token': token,
    };
  }
}
