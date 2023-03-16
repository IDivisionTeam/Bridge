import 'package:core_network/src/model/response/network_response_error.dart';

class NetworkResponse<T> {
  final T? data;
  final NetworkResponseError? error;

  NetworkResponse.success(T data)
      : this.data = data,
        error = null;

  NetworkResponse.failure(NetworkResponseError error)
      : data = null,
        this.error = error;

  bool get hasData => data != null;

  bool get hasError => error != null;
}
