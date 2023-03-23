class NetworkResponse {
  final Map<String, dynamic>? data;
  final Exception? error;

  NetworkResponse.success(Map<String, dynamic> data)
      : this.data = data,
        error = null;

  NetworkResponse.failure(Exception error)
      : data = null,
        this.error = error;

  bool get hasData => data != null;

  bool get hasError => error != null;
}
