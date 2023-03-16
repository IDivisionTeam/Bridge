import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:core_network/src/model/request/network_request_login.dart';
import 'package:core_network/src/model/request/network_request_logout.dart';
import 'package:core_network/src/model/request/network_request_register.dart';
import 'package:core_network/src/util/decoder_extension.dart';
import 'package:core_network/src/util/encoder_extension.dart';

const _baseUrl = 'bridge.zalizniak.duckdns.org';

class AuthApi {
  Future<Map<String, dynamic>> signup(NetworkRequestRegister body) async {
    final client = RetryClient(http.Client());

    try {
      var response = await client.post(
        Uri.http(_baseUrl, 'auth/register'),
        body: body.json,
      );

      return response.responseBody;
    } finally {
      client.close();
    }
  }

  Future<Map<String, dynamic>> login(NetworkRequestLogin body) async {
    final client = RetryClient(http.Client());

    try {
      var response = await client.post(
        Uri.http(_baseUrl, 'auth/login'),
        body: body.json,
      );

      return response.responseBody;
    } finally {
      client.close();
    }
  }

  Future<Map<String, dynamic>> logout(NetworkRequestLogout body) async {
    final client = RetryClient(http.Client());

    try {
      var response = await client.post(
        Uri.http(_baseUrl, 'auth/logout'),
        body: body.json,
      );

      return response.responseBody;
    } finally {
      client.close();
    }
  }
}
