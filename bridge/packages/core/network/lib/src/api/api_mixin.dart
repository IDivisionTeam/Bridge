import 'dart:io';
import 'dart:developer' as dev;

import 'package:core_common/common.dart';
import 'package:core_network/src/model/exception/exceptions.dart';
import 'package:core_network/src/model/response/network_response.dart';
import 'package:core_network/src/model/response/network_response_error.dart';
import 'package:core_network/src/util/decoder_extension.dart';
import 'package:core_network/src/util/encoder_extension.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:meta/meta.dart';

mixin ApiMixin {
  static const _baseUrl = 'bridge.zalizniak.duckdns.org';

  @protected
  Future<NetworkResponse> post({
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

      final body = response.responseBody;
      final statusCode = response.statusCode;
      // TODO(demo): remove after final testing
      dev.log('POST($statusCode): $to\n$body');
      if (statusCode == HttpStatus.ok) {
        return NetworkResponse.success(body);
      }
      return _extractError(statusCode, body);
    } finally {
      client.close();
    }
  }

  @protected
  Future<NetworkResponse> get({
    required String from,
    required Map<String, dynamic>? parameters,
  }) async {
    assert(from.isNotEmpty);
    final client = RetryClient(http.Client());

    try {
      var response = await client.get(
        Uri.http(_baseUrl, from, parameters),
      );

      final body = response.responseBody;
      final statusCode = response.statusCode;
      // TODO(demo): remove after final testing
      dev.log('GET($statusCode): $from\n$body');
      if (statusCode == HttpStatus.ok) {
        return NetworkResponse.success(body);
      }
      return _extractError(statusCode, body);
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

  NetworkResponse _extractError(
    int statusCode,
    Map<String, dynamic> response,
  ) {
    final errorMessage = NetworkResponseError.fromJson(response).message;
    final Exception error;

    switch (statusCode) {
      case HttpStatus.internalServerError:
        error = InternalServerException(errorMessage);
        break;
      case HttpStatus.noContent:
        error = NoContentException(errorMessage);
        break;
      case HttpStatus.badGateway:
        error = BadRequestException(errorMessage);
        break;
      case HttpStatus.unauthorized:
        error = UnauthorizedException(errorMessage);
        break;
      case HttpStatus.forbidden:
        error = ForbiddenException(errorMessage);
        break;
      case HttpStatus.notFound:
        error = NotFoundException(errorMessage);
        break;
      default:
        error = UnexpectedException(errorMessage);
        break;
    }

    return NetworkResponse.failure(error);
  }
}
