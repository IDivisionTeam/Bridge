class NetworkResponse<T> {
  final T? data;
  final Exception? error;

  NetworkResponse.success(T data)
      : this.data = data,
        error = null;

  NetworkResponse.failure(Exception error)
      : data = null,
        this.error = error;

  bool get hasData => data != null;

  bool get hasError => error != null;
}
