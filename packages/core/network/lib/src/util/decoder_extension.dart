import 'dart:convert';

import 'package:http/http.dart' as http;

extension ResponseDecoder on http.Response {
  Map<String, dynamic> get responseBody {
    return jsonDecode(utf8.decode(bodyBytes)) as Map<String, dynamic>;
  }
}
