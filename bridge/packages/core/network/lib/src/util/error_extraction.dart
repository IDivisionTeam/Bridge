import 'package:core_network/src/model/response/network_response.dart';
import 'package:core_network/src/model/response/network_response_error.dart';

NetworkResponse<T> extractError<T>(Map<String, dynamic> response) {
  final error = NetworkResponseError.fromJson(response);
  return NetworkResponse.failure(error);
}
